###################################################
# 
# Group ID (Vulid):  V-38579
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50380r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000065
# Rule Title: The system boot loader configuration file(s) must be owned by root.
# 
# Vulnerability Discussion:  Only root should be able to modify important boot parameters.
# 
# Check Content:  
# To check the ownership of "/etc/grub.conf", run the command: 
# 
# $ ls -lL /etc/grub.conf
# 
# If properly configured, the output should indicate the following owner: "root" 
# If it does not, this is a finding.
# 
# Fix Text: The file "/etc/grub.conf" should be owned by the "root" user to prevent destruction or modification of the file. To properly set the owner of "/etc/grub.conf", run the command: 
# 
# # chown root /etc/grub.conf   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

ls -lL /etc/grub.conf