###################################################
# 
# Group ID (Vulid):  V-38573
# Group Title:  SRG-OS-000021
# Rule ID:  SV-50374r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000061
# Rule Title: The system must disable accounts after three consecutive unsuccessful login attempts.
# 
# Vulnerability Discussion:  Locking out user accounts after a number of incorrect attempts prevents direct password guessing attacks.
# 
# Check Content:  
# To ensure the failed password attempt policy is configured correctly, run the following command: 
# 
# # grep pam_faillock /etc/pam.d/system-auth-ac
# 
# The output should show "deny=3". 
# If that is not the case, this is a finding.
# 
# Fix Text: To configure the system to lock out accounts after a number of incorrect login attempts using "pam_faillock.so": 
# 
# Add the following lines immediately below the "pam_unix.so" statement in the AUTH section of "/etc/pam.d/system-auth-ac": 
# 
# auth [default=die] pam_faillock.so authfail deny=3 unlock_time=604800 fail_interval=900
# 
# auth required pam_faillock.so authsucc deny=3 unlock_time=604800 fail_interval=900
# 
# Note that any updates made to "/etc/pam.d/system-auth-ac" will be overwritten by the "authconfig" program. The "authconfig" program should not be used.   
# 
# CCI: CCI-000044
# 
###################################################

#!/bin/bash

grep pam_faillock /etc/pam.d/system-auth-ac

