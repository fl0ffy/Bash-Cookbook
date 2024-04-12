#!/bin/bash

#####################################################
# Author:			
# Date:			
# Description:		
# Input parameters:	users.txt = a line delimited list of usernames
# Sample usage:	./create_user.sh
######################################################

for i in $(cat users.txt)
do

#add user
useradd $i

# Set up initial home environment
cp -r /etc/skel /home/$i

# Prep for RSA key home
mkdir /home/$i/.ssh
chmod 700 /home/$i/.ssh
chown -R $i.$i /home/$i

# Fix for allowing RSA login while SELinux is set to enforce
restore con -R -v /home/$i/.ssh

done

#Phase2#
# Setup error checking and redirect errors to file and if error notice to file location if no error delete file.