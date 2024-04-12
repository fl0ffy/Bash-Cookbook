###################################################
# 
# Group ID (Vulid):  V-38569
# Group Title:  SRG-OS-000069
# Rule ID:  SV-50370r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000057
# Rule Title: The system must require passwords to contain at least one uppercase alphabetic character.
# 
# Vulnerability Discussion:  Requiring a minimum number of uppercase characters makes password guessing attacks more difficult by ensuring a larger search space.
# 
# Check Content:  
# To check how many uppercase characters are required in a password, run the following command: 
# 
# $ grep pam_cracklib /etc/pam.d/system-auth
# 
# The "ucredit" parameter (as a negative number) will indicate how many uppercase characters are required. The DoD requires at least one uppercase character in a password. This would appear as "ucredit=-1". 
# If ucredit is not found or not set to the required value, this is a finding.
# 
# Fix Text: The pam_cracklib module's "ucredit=" parameter controls requirements for usage of uppercase letters in a password. When set to a negative number, any password will be required to contain that many uppercase characters. When set to a positive number, pam_cracklib will grant +1 additional length credit for each uppercase character. Add "ucredit=-1" after pam_cracklib.so to require use of an uppercase character in passwords.   
# 
# CCI: CCI-000192
# 
###################################################

#!/bin/bash

grep pam_cracklib /etc/pam.d/system-auth