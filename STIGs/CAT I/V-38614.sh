# ###################################################
# 
# Group ID (Vulid):  V-38614
# Group Title:  SRG-OS-000106
# Rule ID:  SV-50415r1_rule
# Severity: CAT I
# Rule Version (STIG-ID):  RHEL-06-000239
# Rule Title: The SSH daemon must not allow authentication using an empty password.
# 
# Vulnerability Discussion:  Configuring this setting for the SSH daemon provides additional assurance that remote login via SSH will require a password, even in the event of misconfiguration elsewhere.
# 
# Check Content:  
# To determine how the SSH daemon's "PermitEmptyPasswords" option is set, run the following command: 
# 
# # grep -i PermitEmptyPasswords /etc/ssh/sshd_config
# 
# If no line, a commented line, or a line indicating the value "no" is returned, then the required value is set. 
# If the required value is not set, this is a finding.
# 
# Fix Text: To explicitly disallow remote login from accounts with empty passwords, add or correct the following line in "/etc/ssh/sshd_config": 
# 
# PermitEmptyPasswords no
# 
# Any accounts with empty passwords should be disabled immediately, and PAM configuration should prevent users from being able to assign themselves empty passwords.   
# 
# CCI: CCI-000766
# 
###################################################

#!/bin/bash

grep -i PermitEmptyPasswords /etc/ssh/sshd_config