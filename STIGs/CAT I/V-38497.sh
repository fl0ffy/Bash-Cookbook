# ###################################################
# 
# Group ID (Vulid):  V-38497
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50298r1_rule
# Severity: CAT I
# Rule Version (STIG-ID):  RHEL-06-000030
# Rule Title: The system must not have accounts configured with blank or null passwords.
# 
# Vulnerability Discussion:  If an account has an empty password, anyone could log in and run commands with the privileges of that account. Accounts with empty passwords should never be used in operational environments.
# 
# Check Content:  
# To verify that null passwords cannot be used, run the following command: 
# 
# # grep nullok /etc/pam.d/system-auth /etc/pam.d/system-auth-ac
# 
# If this produces any output, it may be possible to log into accounts with empty passwords. 
# If NULL passwords can be used, this is a finding.
# 
# Fix Text: If an account is configured for password authentication but does not have an assigned password, it may be possible to log into the account without authentication. Remove any instances of the "nullok" option in "/etc/pam.d/system-auth-ac" to prevent logins with empty passwords.   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

grep nullok /etc/pam.d/system-auth /etc/pam.d/system-auth-ac