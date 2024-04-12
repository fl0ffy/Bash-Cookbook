###################################################
# 
# Group ID (Vulid):  V-38477
# Group Title:  SRG-OS-000075
# Rule ID:  SV-50277r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000051
# Rule Title: Users must not be able to change passwords more than once every 24 hours.
# 
# Vulnerability Discussion:  Setting the minimum password age protects against users cycling back to a favorite password after satisfying the password reuse requirement.
# 
# Check Content:  
# To check the minimum password age, run the command: 
# 
# $ grep PASS_MIN_DAYS /etc/login.defs
# 
# The DoD requirement is 1. 
# If it is not set to the required value, this is a finding.
# 
# Fix Text: To specify password minimum age for new accounts, edit the file "/etc/login.defs" and add or correct the following line, replacing [DAYS] appropriately: 
# 
# PASS_MIN_DAYS [DAYS]
# 
# A value of 1 day is considered sufficient for many environments. The DoD requirement is 1.   
# 
# CCI: CCI-000198
# 
###################################################

#!/bin/bash

grep PASS_MIN_DAYS /etc/login.defs