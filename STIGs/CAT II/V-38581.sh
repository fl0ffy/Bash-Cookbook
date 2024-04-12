###################################################
# 
# Group ID (Vulid):  V-38581
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50382r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000066
# Rule Title: The system boot loader configuration file(s) must be group-owned by root.
# 
# Vulnerability Discussion:  The "root" group is a highly-privileged group. Furthermore, the group-owner of this file should not have any access privileges anyway.
# 
# Check Content:  
# To check the group ownership of "/etc/grub.conf", run the command: 
# 
# $ ls -lL /etc/grub.conf
# 
# If properly configured, the output should indicate the following group-owner. "root" 
# If it does not, this is a finding.
# 
# Fix Text: The file "/etc/grub.conf" should be group-owned by the "root" group to prevent destruction or modification of the file. To properly set the group owner of "/etc/grub.conf", run the command: 
# 
# # chgrp root /etc/grub.conf   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

ls -lL /etc/grub.conf