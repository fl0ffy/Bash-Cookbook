###################################################
# 
# Group ID (Vulid):  V-38571
# Group Title:  SRG-OS-000070
# Rule ID:  SV-50372r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000059
# Rule Title: The system must require passwords to contain at least one lowercase alphabetic character.
# 
# Vulnerability Discussion:  Requiring a minimum number of lowercase characters makes password guessing attacks more difficult by ensuring a larger search space.
# 
# Check Content:  
# To check how many lowercase characters are required in a password, run the following command: 
# 
# $ grep pam_cracklib /etc/pam.d/system-auth
# 
# The "lcredit" parameter (as a negative number) will indicate how many special characters are required. The DoD requires at least one lowercase character in a password. This would appear as "lcredit=-1". 
# If lcredit is not found or not set to the required value, this is a finding.
# 
# Fix Text: The pam_cracklib module's "lcredit=" parameter controls requirements for usage of lowercase letters in a password. When set to a negative number, any password will be required to contain that many lowercase characters. When set to a positive number, pam_cracklib will grant +1 additional length credit for each lowercase character. Add "lcredit=-1" after pam_cracklib.so to require use of a lowercase character in passwords.   
# 
# CCI: CCI-000193
# 
###################################################

#!/bin/bash

grep pam_cracklib /etc/pam.d/system-auth