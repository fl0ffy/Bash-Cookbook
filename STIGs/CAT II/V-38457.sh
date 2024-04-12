###################################################
# 
# Group ID (Vulid):  V-38457
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50257r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000041
# Rule Title: The /etc/passwd file must have mode 0644 or less permissive.
# 
# Vulnerability Discussion:  If the "/etc/passwd" file is writable by a group-owner or the world the risk of its compromise is increased. The file contains the list of accounts on the system and associated information, and protection of this file is critical for system security.
# 
# Check Content:  
# To check the permissions of "/etc/passwd", run the command: 
# 
# $ ls -l /etc/passwd
# 
# If properly configured, the output should indicate the following permissions: "-rw-r--r--" 
# If it does not, this is a finding.
# 
# Fix Text: To properly set the permissions of "/etc/passwd", run the command: 
# 
# # chmod 0644 /etc/passwd   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

ls -l /etc/passwd