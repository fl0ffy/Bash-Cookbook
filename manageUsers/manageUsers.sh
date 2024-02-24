#!/bin/bash
#####################################################
# Author:                    John Bernat
# Date:                       25Mar2016
# Description:            Manage Users
# Input parameters:
# Sample usage:        ./users.sh -caku testuser
######################################################

username=
remote_host=
remote_user=ec2-user
remote_key=key.pem

if [ -z $1 ];
then
    echo “No arguments supplied.  Please use ‘-H’ option for help menu.”
    exit 1
fi

optstring=‘:acdg:h:Hikpr:R:tTu:'

while getopts “$optstring” opt; do
case $opt in
    ‘H’) cat << HELP
Usage: $0 [options] [arguments]

Options:
    -a    Make user an admin
    -c    Create a user
    -d    Delete a user
    -g [group,group]  Add user to group/s
    -h [hostname]  Specifies remote host to send keys
    -H    Help menu
    -i    Import keys from tarball located in /tmp directory
    -k    Create keys for user
    -p    Prepare user keys to be pulled from gateway to sftp and send to user
    -r [remote user]  Specifies username to login to remote host to transfer keys
    -R [remote key]  Specifies key to use to transfer keys to remote host
    -t    Transfer keys to remote host
    -T    Transfer this script to remote host
    -u [username]    Specifies the new username

Common Uses:

Create a new admin user and generate ssh keys
$0 -caku testuser

Create new user, generate ssh keys and transfer the keys and this script to a remote host
$0 -cku testuser -Tth 1.2.3.4

Create new user and import keys from tarsal located in /tmp
$0 -ciu testuser

HELP
    exit 0
    ;;
esac
done
OPTIND=1

while getopts “$optstring” opt; do
case $opt in
     ‘g’) group=$OPTARG ;;
     ‘h’) remote_host=$OPTARG ;;
     ‘r’) remote_user=$OPTARG ;;
     ‘R’) remote_key=$OPTARG ;;
     ‘u’) username=$OPTARG ;;
esac
done
OPTIND=1

while getopts “$optstring” opt; do
case $opt in
    ‘c’) useradd -md /home/$username -G $groups $username
    runuser -l $username -c ‘mkdir ~/.ssh'
    restorecon -Rv /home/$username/.ssh &>/dev/null
    echo “Created user: $username”
    echo “Added $username to $groups”
    ;;
    ‘d’) userdel -r $username
    echo “Deleted user: $username”
    ;;
esac
done
OPTIND=1

while getopts “$optstring” opt; do
case $opt in
    ‘a’) usermod -aG wheel $username
    sed -i ’s/^%wheel/%wheel’ /etc/sudoers
    echo “Granted admin privileges to $username”
    ;;
    ‘k’) runuser -l $username -c ‘ssh-keygen -t rsa -f ~/.ssh/id_rsa -P ”"' &>/dev/null
    runuser -l $username -c ‘cp ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys2'
    echo “Created keys for $username”
    ;;
    ‘i’) tar -xvpf /tmp/$username.tar -C / &>/dev/null
    echo “Imported keys for $username”
    ;;
esac
done
OPTIND=1

while getopts “$optstring” opt; do
case $opt in
   ‘p’) tar -cvf /tmp/$username.tar /home/$username/.ssh/id_rsa /home/$username/.ssh/id_rsa.pub /home/$username/.ssh/authorized_keys2 &>/dev/null
    chown $SUDO_USER /tmp/$username.tar
    echo “Go to gateway and run: ./pullKeys.sh $username"
    ;;
    ’t’) runuser -l $SUDO_USER -c ‘mkdir /tmp/transfer'
    tar -cvf /tmp/transfer/$username.tar /home/$username/.ssh/id_*.pub /home/$username/.ssh/authorized_keys2 &>/dev/null
    chown $SUDO_USER /tmp/transfer/$username.tar
    runuser -l $SUDO_USER -c ‘scp -i $remote_key /tmp/transfer/$username.tar $remote_user@$remote_host:/tmp/' &>/dev/null
    rm -rf /tmp/transfer &>/dev/null
    echo “Transferred $username’s keys to $remote_host as $remote_user using $remote_key"
    ;;
    ’T’) cp $0 /tmp/$0
    chown $SUDO_USER /tmp/$0
    runuser -l $SUDO_USER -c ‘scp -i $remote_key /tmp/$0 $remote_user@$remote_host:/tmp/' &>/dev/null
    rm -f /tmp/$0
    echo “Transferred $0 to $remote_host”
    ;;
esac
done
OPTIND=1

while getopts “$optstring” opt; do
case $opt in
     \?) echo “Invalid option: -$OPTARG” >&2 ; exit 1 ;;
     :) echo “Option $OPTARG requires an argument.” >&2 ; exit 1 ;;
esac
done
