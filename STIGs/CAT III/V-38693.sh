# ###################################################
# 
# Group ID (Vulid):  V-38693
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50494r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000299
# Rule Title: The system must require passwords to contain no more than three consecutive repeating characters.
# 
# Vulnerability Discussion:  Passwords with excessive repeating characters may be more vulnerable to password-guessing attacks.
# 
# Check Content:  
# To check the maximum value for consecutive repeating characters, run the following command: 
# 
# $ grep pam_cracklib /etc/pam.d/system-auth
# 
# Look for the value of the "maxrepeat" parameter. The DoD requirement is 3. 
# If maxrepeat is not found or not set to the required value, this is a finding.
# 
# Fix Text: The pam_cracklib module's "maxrepeat" parameter controls requirements for consecutive repeating characters. Edit the "/etc/pam.d/system-auth" file to include the following line prior to the "password include system-auth-ac" line: 
# 
# password required pam_cracklib.so maxrepeat=3   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

grep pam_cracklib /etc/pam.d/system-auth