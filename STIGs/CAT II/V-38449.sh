###################################################
# 
# Group ID (Vulid):  V-38449
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50249r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000038
# Rule Title: The /etc/gshadow file must have mode 0000.
# 
# Vulnerability Discussion:  The /etc/gshadow file contains group password hashes. Protection of this file is critical for system security.
# 
# Check Content:  
# To check the permissions of "/etc/gshadow", run the command: 
# 
# $ ls -l /etc/gshadow
# 
# If properly configured, the output should indicate the following permissions: "----------" 
# If it does not, this is a finding.
# 
# Fix Text: To properly set the permissions of "/etc/gshadow", run the command: 
# 
# # chmod 0000 /etc/gshadow   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

ls -l /etc/gshadow