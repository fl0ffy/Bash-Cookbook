# ###################################################
# 
# Group ID (Vulid):  V-38461
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50261r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000044
# Rule Title: The /etc/group file must have mode 0644 or less permissive.
# 
# Vulnerability Discussion:  The "/etc/group" file contains information regarding groups that are configured on the system. Protection of this file is important for system security.
# 
# Check Content:  
# To check the permissions of "/etc/group", run the command: 
# 
# $ ls -l /etc/group
# 
# If properly configured, the output should indicate the following permissions: "-rw-r--r--" 
# If it does not, this is a finding.
# 
# Fix Text: To properly set the permissions of "/etc/group", run the command: 
# 
# # chmod 644 /etc/group   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

ls -l /etc/group