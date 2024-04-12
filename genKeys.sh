#!/bin/bash

#####################################################
# Author:			John Bernat
# Date:			01Mar2016
# Description:		Sets up SSH keys for users listed in users.txt
# Input parameters:		users.txt = a line delimited list of usernames
# Sample usage:		./genKeys.sh
######################################################

for i in $(cat users.txt)
do

# Generate RSA keys
runuser -l $i -c ‘ssh-keygen -t rsa -f ~/.ssh/id_rsa -P “”’
runuser -l $i -c ‘cp ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys’
chmod 644 /home$i/.ssh/id_rsa.pub /home$i/.ssh/authorized_keys
cd /home/$i/.ssh
tar -cvf $i.tar ./*
cp /home/$i/.ssh/*.tar /tmp/

done

#Phase2#
# Setup error checking and redirect errors to file and if error notice to file location if no error delete file.