###################################################
# 
# Group ID (Vulid):  V-38583
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50384r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000067
# Rule Title: The system boot loader configuration file(s) must have mode 0600 or less permissive.
# 
# Vulnerability Discussion:  Proper permissions ensure that only the root user can modify important boot parameters.
# 
# Check Content:  
# To check the permissions of "/etc/grub.conf", run the command: 
# 
# $ ls -lL /etc/grub.conf
# 
# If properly configured, the output should indicate the following permissions: "-rw-------" 
# If it does not, this is a finding.
# 
# Fix Text: File permissions for "/etc/grub.conf" should be set to 600, which is the default. To properly set the permissions of "/etc/grub.conf", run the command: 
# 
# # chmod 600 /etc/grub.conf   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

ls -lL /etc/grub.conf