###################################################
# 
# Group ID (Vulid):  V-38681
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50482r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000294
# Rule Title: All GIDs referenced in /etc/passwd must be defined in /etc/group
# 
# Vulnerability Discussion:  Inconsistency in GIDs between /etc/passwd and /etc/group could lead to a user having unintended rights.
# 
# Check Content:  
# To ensure all GIDs referenced in /etc/passwd are defined in /etc/group, run the following command: 
# 
# # pwck -rq
# 
# There should be no output. 
# If there is output, this is a finding.
# 
# Fix Text: Add a group to the system for each GID referenced without a corresponding group.   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

pwck -rq