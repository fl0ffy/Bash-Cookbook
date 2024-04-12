###################################################
# 
# Group ID (Vulid):  V-38590
# Group Title:  SRG-OS-000030
# Rule ID:  SV-50391r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000071
# Rule Title: The system must allow locking of the console screen in text mode.
# 
# Vulnerability Discussion:  Installing "screen" ensures a console locking capability is available for users who may need to suspend console logins.
# 
# Check Content:  
# Run the following command to determine if the "screen" package is installed: 
# 
# # rpm -q screen
# 
# If the package is not installed, this is a finding.
# 
# Fix Text: To enable console screen locking when in text mode, install the "screen" package: 
# 
# # yum install screen
# 
# Instruct users to begin new terminal sessions with the following command: 
# 
# $ screen
# 
# The console can now be locked with the following key combination: 
# 
# ctrl+a x   
# 
# CCI: CCI-000058
# 
###################################################

#!/bin/bash

rpm -q screen

yum install screen