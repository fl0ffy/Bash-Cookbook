# ###################################################
# 
# Group ID (Vulid):  V-38448
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50248r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000037
# Rule Title: The /etc/gshadow file must be group-owned by root.
# 
# Vulnerability Discussion:  The "/etc/gshadow" file contains group password hashes. Protection of this file is critical for system security.
# 
# Check Content:  
# To check the group ownership of "/etc/gshadow", run the command: 
# 
# $ ls -l /etc/gshadow
# 
# If properly configured, the output should indicate the following group-owner. "root" 
# If it does not, this is a finding.
# 
# Fix Text: To properly set the group owner of "/etc/gshadow", run the command: 
# 
# # chgrp root /etc/gshadow   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

ls -l /etc/gshadow