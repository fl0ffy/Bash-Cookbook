###################################################
# 
# Group ID (Vulid):  V-38496
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50297r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000029
# Rule Title: Default system accounts, other than root, must be locked.
# 
# Vulnerability Discussion:  Disabling authentication for default system accounts makes it more difficult for attackers to make use of them to compromise a system.
# 
# Check Content:  
# To obtain a listing of all users and the contents of their shadow password field, run the command: 
# 
# $ awk -F: '{print $1 ":" $2}' /etc/shadow
# 
# Identify the system accounts from this listing. These will primarily be the accounts with UID numbers less than 500, other than root. 
# If any system account (other than root) has a valid password hash, this is a finding.
# 
# Fix Text: Some accounts are not associated with a human user of the system, and exist to perform some administrative function. An attacker should not be able to log into these accounts. 
# 
# Disable login access to these accounts with the command: 
# 
# # passwd -l [SYSACCT]   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

awk -F: '{print $1 ":" $2}' /etc/shadow
