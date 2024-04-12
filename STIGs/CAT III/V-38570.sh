###################################################
# 
# Group ID (Vulid):  V-38570
# Group Title:  SRG-OS-000266
# Rule ID:  SV-50371r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000058
# Rule Title: The system must require passwords to contain at least one special character.
# 
# Vulnerability Discussion:  Requiring a minimum number of special characters makes password guessing attacks more difficult by ensuring a larger search space.
# 
# Check Content:  
# To check how many special characters are required in a password, run the following command: 
# 
# $ grep pam_cracklib /etc/pam.d/system-auth
# 
# The "ocredit" parameter (as a negative number) will indicate how many special characters are required. The DoD requires at least one special character in a password. This would appear as "ocredit=-1". 
# If ocredit is not found or not set to the required value, this is a finding.
# 
# Fix Text: The pam_cracklib module's "ocredit=" parameter controls requirements for usage of special (or ``other'') characters in a password. When set to a negative number, any password will be required to contain that many special characters. When set to a positive number, pam_cracklib will grant +1 additional length credit for each special character. Add "ocredit=-1" after pam_cracklib.so to require use of a special character in passwords.   
# 
# CCI: CCI-001619
# 
###################################################

#!/bin/bash

grep pam_cracklib /etc/pam.d/system-auth