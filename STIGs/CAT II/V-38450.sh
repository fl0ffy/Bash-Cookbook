###################################################
# 
# Group ID (Vulid):  V-38450
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50250r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000039
# Rule Title: The /etc/passwd file must be owned by root.
# 
# Vulnerability Discussion:  The "/etc/passwd" file contains information about the users that are configured on the system. Protection of this file is critical for system security.
# 
# Check Content:  
# To check the ownership of "/etc/passwd", run the command: 
# 
# $ ls -l /etc/passwd
# 
# If properly configured, the output should indicate the following owner: "root" 
# If it does not, this is a finding.
# 
# Fix Text: To properly set the owner of "/etc/passwd", run the command: 
# 
# # chown root /etc/passwd   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

ls -l /etc/passwd