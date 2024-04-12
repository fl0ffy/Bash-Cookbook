###################################################
# 
# Group ID (Vulid):  V-38482
# Group Title:  SRG-OS-000071
# Rule ID:  SV-50282r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000056
# Rule Title: The system must require passwords to contain at least one numeric character.
# 
# Vulnerability Discussion:  Requiring digits makes password guessing attacks more difficult by ensuring a larger search space.
# 
# Check Content:  
# To check how many digits are required in a password, run the following command: 
# 
# $ grep pam_cracklib /etc/pam.d/system-auth
# 
# The "dcredit" parameter (as a negative number) will indicate how many digits are required. The DoD requires at least one digit in a password. This would appear as "dcredit=-1". 
# If dcredit is not found or not set to the required value, this is a finding.
# 
# Fix Text: The pam_cracklib module's "dcredit" parameter controls requirements for usage of digits in a password. When set to a negative number, any password will be required to contain that many digits. When set to a positive number, pam_cracklib will grant +1 additional length credit for each digit. Add "dcredit=-1" after pam_cracklib.so to require use of a digit in passwords.   
# 
# CCI: CCI-000194
# 
###################################################

#!/bin/bash

grep pam_cracklib /etc/pam.d/system-auth

