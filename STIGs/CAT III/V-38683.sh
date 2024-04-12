###################################################
# 
# Group ID (Vulid):  V-38683
# Group Title:  SRG-OS-000121
# Rule ID:  SV-50484r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000296
# Rule Title: All accounts on the system must have unique user or account names
# 
# Vulnerability Discussion:  Unique usernames allow for accountability on the system.
# 
# Check Content:  
# Run the following command to check for duplicate account names: 
# 
# # pwck -rq
# 
# If there are no duplicate names, no line will be returned. 
# If a line is returned, this is a finding.
# 
# Fix Text: Change usernames, or delete accounts, so each has a unique name.   
# 
# CCI: CCI-000804
# 
###################################################

#!/bin/bash

pwck -rq