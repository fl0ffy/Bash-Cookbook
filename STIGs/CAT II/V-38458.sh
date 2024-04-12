# ###################################################
# 
# Group ID (Vulid):  V-38458
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50258r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000042
# Rule Title: The /etc/group file must be owned by root.
# 
# Vulnerability Discussion:  The "/etc/group" file contains information regarding groups that are configured on the system. Protection of this file is important for system security.
# 
# Check Content:  
# To check the ownership of "/etc/group", run the command: 
# 
# $ ls -l /etc/group
# 
# If properly configured, the output should indicate the following owner: "root" 
# If it does not, this is a finding.
# 
# Fix Text: To properly set the owner of "/etc/group", run the command: 
# 
# # chown root /etc/group   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

ls -l /etc/group