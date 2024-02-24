#!/bin/bash

############################################################################
#
# Author:		Johnathan Bernat
# Date:			29 Apr 2013
# Description:		Sets up networking on deployed RedHat images.
# Input parameters:	$1 refers to variables in array pool
# Sample usage:	./script array1
#
#############################################################################

#################################################################
#								#
#			Array Pool				#
#								#
#################################################################

#Example input array and variable:
#array1IP=( x.x.x.a x.x.x.b x.x.x.c )   -  Order listed will match eth in ascending order starting from eth0
#array1HOSTNAME=FQDN.domain

#array1
array1IP=( 192.168.5.40 192.168.10.40 192.168.111.40 )
array1HOSTNAME=FOO.mydomain.com

#array2
array2=(192.168.7.41 192.168.14.41 192.168.123.41 )
array2HOSTNAME=BAR.mydomain.com

#################################################################
#								#
#			Command check				#
#								#
#################################################################

if [ -z $1 ]
then
echo ""
echo “Please enter valid host you would like to configure.”
echo “example: ./script array2”
echo ""
exit
else

if [ -z $(eval echo \${$1IP[0]}) ]
then
echo ""
echo “Host entered does not match.”
echo “Please enter valid host you would like to configure.”
echo “example: ./script array2”
echo ""
exit
else
echo 'Configuring '$(eval echo "$"$1HOSTNAME | cut -d"." -f1)

fi
fi


#################################################################
#								#
#			Network Interfaces			#
#								#
#################################################################

rm -f /etc/sysconfig/network-scripts/ifcfg-eth*

COUNTER=0

for i in $(eval echo \${$1IP[@]})
do

ipaddr=$i

echo -e 'DEVICE=eth'$COUNTER'\nBOOTPROTO=none\nONBOOT=yes\nIPADDR='$ipaddr'\NETMASK=255.255.255.0\nTYPE=ethernet\nUSERCTL=no\nIPV6INIT=no\nPEERDNS=no' > /etc/sysconfig/network-scripts/ifcfg-eth$(eval echo \$COUNTER)

let COUNTER=$COUNTER+1

done

#################################################################
#								#
#			static-routes				#
#								#
#################################################################

COUNTER=0

for i in $(eval echo \${$1IP[@]})
do

ipaddr=$(echo $i | cut -d"." -f3)
fill=$(echo $i | cut -d"." -f1-3)

#routed (has a gw)
if [ "$ipaddr" -eq 5 ] ||  [ "$ipaddr" -eq 7 ]
then
echo -e 'any net '$fill'.0 netmask 255.255.255.0 gw '$fill'.1 eth'$COUNTER'' > /etc/sysconfig/static-routes
else

#not routed (gw does not exsist)
if [ "$ipaddr" -eq 10 ] ||  [ "$ipaddr" -eq 14 ] ||  [ "$ipaddr" -eq 111 ] ||  [ "$ipaddr" -eq 123 ]
then
echo -e 'any net '$fill'.0 netmask 255.255.255.0 eth'$COUNTER'' >> /etc/sysconfig/static-routes
else

staticerror=’’( eval echo ‘$i’)’ was not added to static-routes file.’

fi
fi

let COUNTER=$COUNTER+1

done

#################################################################
#								#
#			resolv.conf				#
#								#
#################################################################

for i in $(eval echo \${$1IP[0]})
do

ipaddr=$(echo $i | cut -d"." -f1)

if [ "$ipaddr" -eq 192 ]
then 
echo -e 'nameserver\t192.168.64.64' > /etc/resolv.conf
else

resolverror= "ERROR: Nameserver not available"

fi

done

#################################################################
#								#
#			Yum Repo				#
#								#
#################################################################

echo -e '[<REPO-NAME>]\nname=<name>\nbaseurl=http://<ip/path>\nenabled=1\ngpgcheck=0' > /etc/yum.repos.d/<REPO-NAME>
sed -i 's/enabled = 1/enabled = 0/g' /etc/yum/pluginconf.d/rhnplugin.conf


for i in $(eval echo \${$1IP[0]})
do

ipaddr=$(echo $i | cut -d"." -f1)

if [ "$ipaddr" -eq 192 ]
then 
echo -e '<REPO-IP>\t<REPO-NAME>' > /etc/hosts
else

repoerror= "ERROR: Repo not accessible"

fi

done


#################################################################
#								#
#			hostname				#
#								#
#################################################################

echo -e 'NETWORKING=yes\nNETWORKING_IPV6=no\nIPV6INIT=no\nHOSTNAME='$(eval echo "$"$1HOSTNAME | cut -d"." -f1)'' > /etc/sysconfig/network
echo -e '127.0.0.1\tlocalhost.localdomain\tlocalhost\n::1\t\tlocalhost6.localdomain6\tlocalhost6\n'$( eval echo \${$1IP[0]})'\t'$(eval echo "$"$1HOSTNAME)'\t'$(eval echo "$"$1HOSTNAME | cut -d"." -f1)'' > /etc/hosts
hostname $(eval echo "$"$1HOSTNAME | cut -d"." -f1)

#################################################################
#								#
#			NTP					#
#								#
#################################################################

service ntpd stop
echo ‘server x.x.x.x’ >> /etc/ntp.conf
ntpdate x.x.x.x
service ntpd start
chkconfig ntpd on

#################################################################
#								#
#			Localuser				#
#								#
#################################################################
useradd <localuser>
chage -I -1 -m 0 -M 99999 -E -1 <localuser>
chage -l <localuser>

#add to visudo
#change passwd

#################################################################
#								#
#			Login Message				#
#								#
#################################################################

#For display a message before login you edit: /etc/issue
#For local login (or telnet) you need to modify:/etc/motd

#################################################################
#								#
#			Errors					#
#								#
#################################################################

service network restart
yum -y update

clear
date
echo $staticerror
echo $resolverror
echo $repoerror
echo $(hostname) has been configured! 

#################################################################
#								#
#			Quote of the day			#
#								#
#################################################################

num_quotes=11
rand=$[ ( $RANDOM % $num_quotes ) + 1 ]

echo ""
echo '-------------------------------------------------------------------------------'
echo ""

case $rand in
1)echo "If you wish to make an apple pie from scratch, you must first invent the universe."  | fmt -80
       	echo ""
       	echo -e '\t\t\t\t\t\t~ Carl Sagan';;
2) echo "A celibate clergy is an especially good idea, because it tends to suppress any hereditary propensity toward fanaticism."  | fmt -80
       	echo ""
       	echo -e '\t\t\t\t\t\t~ Carl Sagan';;
3) echo "The universe seems neither benign nor hostile, merely indifferent."  | fmt -80
       	echo ""
       	echo -e '\t\t\t\t\t\t~ Carl Sagan';;
4) echo "The universe is not required to be in perfect harmony with human ambition."  | fmt -80
       	echo ""
       	echo -e '\t\t\t\t\t\t~ Carl Sagan';;
5) echo "It is far better to grasp the universe as it really is than to persist in delusion, however satisfying and reassuring."  | fmt -80
       	echo ""
      	echo -e '\t\t\t\t\t\t~ Carl Sagan';;
6) echo "But the fact that some geniuses were laughed at does not imply that all who are laughed at are geniuses. They laughed at Columbus, they laughed at Fulton, they laughed at the Wright Brothers. But they also laughed at Bozo the Clown."  | fmt -80
       	echo ""
       	echo -e '\t\t\t\t\t\t~ Carl Sagan';;
7) echo "We live in a society exquisitely dependent on science and technology, in which hardly anyone knows anything about science and technology."  | fmt -80
       	echo ""
       	echo -e '\t\t\t\t\t\t~ Carl Sagan';;
8) echo "If we long to believe that the stars rise and set for us, that we are the reason there is a Universe, does science do us a disservice in deflating our conceits?"  | fmt -80
       	echo ""
       	echo -e '\t\t\t\t\t\t~ Carl Sagan';;
9) echo "Where we have strong emotions, we're liable to fool ourselves."  | fmt -80
       	echo ""
       	echo -e '\t\t\t\t\t\t~ Carl Sagan';;
10) echo "Who are we? We find that we live on an insignificant planet of a humdrum star lost in a galaxy tucked away in some forgotten corner of a universe in which there are far more galaxies than people."  | fmt -80
	echo ""
	echo -e '\t\t\t\t\t\t~ Carl Sagan';;
11) echo “We are but a mirror into which you view yourself.” | fmt -80
	echo “”
	echo -e  '\t\t\t\t\t\t~ Matt Tobin';;

esac

echo ""
echo '-------------------------------------------------------------------------------'
echo ""


