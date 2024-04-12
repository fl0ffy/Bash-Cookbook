###################################################
# 
# Group ID (Vulid):  V-38503
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50304r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000034
# Rule Title: The /etc/shadow file must be group-owned by root.
# 
# Vulnerability Discussion:  The "/etc/shadow" file stores password hashes. Protection of this file is critical for system security.
# 
# Check Content:  
# To check the group ownership of "/etc/shadow", run the command: 
# 
# $ ls -l /etc/shadow
# 
# If properly configured, the output should indicate the following group-owner. "root" 
# If it does not, this is a finding.
# 
# Fix Text: To properly set the group owner of "/etc/shadow", run the command: 
# 
# # chgrp root /etc/shadow   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

ls -l /etc/shadow