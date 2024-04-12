###################################################
# 
# Group ID (Vulid):  V-38459
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50259r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000043
# Rule Title: The /etc/group file must be group-owned by root.
# 
# Vulnerability Discussion:  The "/etc/group" file contains information regarding groups that are configured on the system. Protection of this file is important for system security.
# 
# Check Content:  
# To check the group ownership of "/etc/group", run the command: 
# 
# $ ls -l /etc/group
# 
# If properly configured, the output should indicate the following group-owner. "root" 
# If it does not, this is a finding.
# 
# Fix Text: To properly set the group owner of "/etc/group", run the command: 
# 
# # chgrp root /etc/group   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

ls -l /etc/group