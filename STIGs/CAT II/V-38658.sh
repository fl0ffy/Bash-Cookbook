###################################################
# 
# Group ID (Vulid):  V-38658
# Group Title:  SRG-OS-000077
# Rule ID:  SV-50459r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000274
# Rule Title: The system must prohibit the reuse of passwords within twenty-four iterations.
# 
# Vulnerability Discussion:  Preventing reuse of previous passwords helps ensure that a compromised password is not reused by a user.
# 
# Check Content:  
# To verify the password reuse setting is compliant, run the following command: 
# 
# $ grep remember /etc/pam.d/system-auth
# 
# The output should show the following at the end of the line: 
# 
# remember=24
# 
# If it does not, this is a finding.
# 
# Fix Text: Do not allow users to reuse recent passwords. This can be accomplished by using the "remember" option for the "pam_unix" PAM module. In the file "/etc/pam.d/system-auth", append "remember=24" to the line which refers to the "pam_unix.so" module, as shown: 
# 
# password sufficient pam_unix.so [existing_options] remember=24
# 
# The DoD requirement is 24 passwords.   
# 
# CCI: CCI-000200
# 
###################################################

#!/bin/bash

grep remember /etc/pam.d/system-auth

