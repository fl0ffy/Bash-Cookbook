###################################################
# 
# Group ID (Vulid):  V-38502
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50303r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000033
# Rule Title: The /etc/shadow file must be owned by root.
# 
# Vulnerability Discussion:  The "/etc/shadow" file contains the list of local system accounts and stores password hashes. Protection of this file is critical for system security. Failure to give ownership of this file to root provides the designated owner with access to sensitive information which could weaken the system security posture.
# 
# Check Content:  
# To check the ownership of "/etc/shadow", run the command: 
# 
# $ ls -l /etc/shadow
# 
# If properly configured, the output should indicate the following owner: "root" 
# If it does not, this is a finding.
# 
# Fix Text: To properly set the owner of "/etc/shadow", run the command: 
# 
# # chown root /etc/shadow   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

ls -l /etc/shadow