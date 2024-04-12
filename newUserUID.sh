#!/bin/bash

#####################################################
# Author:			John Bernat
# Date:			15Mar2016
# Description:		Calculates next available UID
# Input parameters:	none
# Prerequisites:		Must be run on LDAP server
# Sample usage:	./newUserUID.sh
######################################################

# Determine last sequential UID used
LAST_UID=$(ldapsearch -D cn=<CN>,ou=<OU>,ou=<OU>,dc=<DC>,dc=<DC> -b dc=<DC>,dc=<DC> -x -w <password> -H ldaps://<LDAP -IP>,ldaps://<LDAP-IP> | grep "uidNumber" | sort | tail -1 | cut -d " " -f 2)

# Calculate next available UID
NEW_UID=$(($LAST_UID + 1)) 

# Output new UID that should be used
echo -e “Use $(tput bold) $NEW_UID $(tput sgr0) for new user”