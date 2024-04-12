#!/bin/bash

ip1=
ip2=
ip3=
vlan1=
vlan1=
vlan1=
hostname=
domaincred=

#################################################	
#						#
#		Networking			#
#						#
#################################################

echo -e 'DEVICE=eth0\nBOOTPROTO=none\nONBOOT=yes\nIPADDR='$ip1'\NETMASK=255.255.255.0\nGATEWAY=192.168.'$vlan1'.1\nTYPE=ethernet\nUSERCTL=no\nIPV6INIT=no\nPEERDNS=no' > /etc/sysconfig/network-scripts/ifcfg-eth0

#echo -e 'DEVICE=eth1\nBOOTPROTO=none\nONBOOT=yes\nIPADDR='$ip2'\NETMASK=255.255.255.0\nGATEWAY=192.168.'$vlan2'.1\nTYPE=ethernet\nUSERCTL=no\nIPV6INIT=no\nPEERDNS=no' > /etc/sysconfig/network-scripts/ifcfg-eth1

#echo -e 'DEVICE=eth2\nBOOTPROTO=none\nONBOOT=yes\nIPADDR='$ip3'\NETMASK=255.255.255.0\nGATEWAY=192.168.'$vlan3'.1\nTYPE=ethernet\nUSERCTL=no\nIPV6INIT=no\nPEERDNS=no' > /etc/sysconfig/network-scripts/ifcfg-eth2

echo -e 'NETWORKING=yes\nNETWORKING_IPV6=no\nIPV6INIT=no\nHOSTNAME='$hostname'' > /etc/sysconfig/network

echo -e '127.0.0.1\tlocalhost.localdomain\tlocalhost\n::1\t\tlocalhost6.localdomain6\tlocalhost6\n'$ip1'\t'$hostname'.cci.ic.local\t'$hostname'' > /etc/hosts

echo -e 'nameserver 192.168.x.x' > /etc/resolv.conf

service network restart

#################################################	
#						#
#		Quest				#
#						#
#################################################



#################################################	
#						#
#		Likewise			#
#						#
#################################################

/opt/likewise/bin/domainjoin-cli join cci.ic.local $domaincred
/opt/likewise/bin/domainjoin-cli query
/opt/likewise/bin/lwconfig AssumeDefaultDomain True
/opt/likewise/bin/lwregshell set_value '[HKEY_THIS_MACHINE\Services\lsass\Parameters\Providers\ActiveDirectory]' LoginShellTemplate /bin/bash
/opt/likewise/bin/lwregshell set_value '[HKEY_THIS_MACHINE\Services\lsass\Parameters\Providers\Local]' LoginShellTemplate /bin/bash
/opt/likewise/bin/lwsm refresh lsass
/opt/likewise/bin/lw-ad-cache --delete-all

#################################################	
#						#
#		Complete			#
#						#
#################################################

echo "You're machine is now ready!"
echo "Please reboot and punch matt"