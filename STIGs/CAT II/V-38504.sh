# ###################################################
# 
# Group ID (Vulid):  V-38504
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50305r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000035
# Rule Title: The /etc/shadow file must have mode 0000.
# 
# Vulnerability Discussion:  The "/etc/shadow" file contains the list of local system accounts and stores password hashes. Protection of this file is critical for system security. Failure to give ownership of this file to root provides the designated owner with access to sensitive information which could weaken the system security posture.
# 
# Check Content:  
# To check the permissions of "/etc/shadow", run the command: 
# 
# $ ls -l /etc/shadow
# 
# If properly configured, the output should indicate the following permissions: "----------" 
# If it does not, this is a finding.
# 
# Fix Text: To properly set the permissions of "/etc/shadow", run the command: 
# 
# # chmod 0000 /etc/shadow   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

ls -l /etc/shadow