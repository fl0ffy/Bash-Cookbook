###################################################
# 
# Group ID (Vulid):  V-38479
# Group Title:  SRG-OS-000076
# Rule ID:  SV-50279r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000053
# Rule Title: User passwords must be changed at least every 60 days.
# 
# Vulnerability Discussion:  Setting the password maximum age ensures users are required to periodically change their passwords. This could possibly decrease the utility of a stolen password. Requiring shorter password lifetimes increases the risk of users writing down the password in a convenient location subject to physical compromise.
# 
# Check Content:  
# To check the maximum password age, run the command: 
# 
# $ grep PASS_MAX_DAYS /etc/login.defs
# 
# The DoD requirement is 60. 
# If it is not set to the required value, this is a finding.
# 
# Fix Text: To specify password maximum age for new accounts, edit the file "/etc/login.defs" and add or correct the following line, replacing [DAYS] appropriately: 
# 
# PASS_MAX_DAYS [DAYS]
# 
# The DoD requirement is 60.   
# 
# CCI: CCI-000199
# 
###################################################

#!/bin/bash

grep PASS_MAX_DAYS /etc/login.defs