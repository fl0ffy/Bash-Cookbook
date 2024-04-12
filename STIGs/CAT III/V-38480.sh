###################################################
# 
# Group ID (Vulid):  V-38480
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50280r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000054
# Rule Title: Users must be warned 7 days in advance of password expiration.
# 
# Vulnerability Discussion:  Setting the password warning age enables users to make the change at a practical time.
# 
# Check Content:  
# To check the password warning age, run the command: 
# 
# $ grep PASS_WARN_AGE /etc/login.defs
# 
# The DoD requirement is 7. 
# If it is not set to the required value, this is a finding.
# 
# Fix Text: To specify how many days prior to password expiration that a warning will be issued to users, edit the file "/etc/login.defs" and add or correct the following line, replacing [DAYS] appropriately: 
# 
# PASS_WARN_AGE [DAYS]
# 
# The DoD requirement is 7.   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

grep PASS_WARN_AGE /etc/login.defs