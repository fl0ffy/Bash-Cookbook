###################################################
# 
# Group ID (Vulid):  V-38443
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50243r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000036
# Rule Title: The /etc/gshadow file must be owned by root.
# 
# Vulnerability Discussion:  The "/etc/gshadow" file contains group password hashes. Protection of this file is critical for system security.
# 
# Check Content:  
# To check the ownership of "/etc/gshadow", run the command: 
# 
# $ ls -l /etc/gshadow
# 
# If properly configured, the output should indicate the following owner: "root" 
# If it does not, this is a finding.
# 
# Fix Text: To properly set the owner of "/etc/gshadow", run the command: 
# 
# # chown root /etc/gshadow   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash


ls -l /etc/gshadow