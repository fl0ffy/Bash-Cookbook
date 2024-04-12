###################################################
# 
# Group ID (Vulid):  V-38469
# Group Title:  SRG-OS-000259
# Rule ID:  SV-50269r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000047
# Rule Title: All system command files must have mode 0755 or less permissive.
# 
# Vulnerability Discussion:  System binaries are executed by privileged users, as well as system services, and restrictive permissions are necessary to ensure execution of these programs cannot be co-opted.
# 
# Check Content:  
# System executables are stored in the following directories by default: 
# 
# /bin
# /usr/bin
# /usr/local/bin
# /sbin
# /usr/sbin
# /usr/local/sbin
# 
# All files in these directories should not be group-writable or world-writable. To find system executables that are group-writable or world-writable, run the following command for each directory [DIR] which contains system executables: 
# 
# $ find -L [DIR] -perm /022
# 
# If any system executables are found to be group-writable or world-writable, this is a finding.
# 
# Fix Text: System executables are stored in the following directories by default: 
# 
# /bin
# /usr/bin
# /usr/local/bin
# /sbin
# /usr/sbin
# /usr/local/sbin
# 
# If any file in these directories is found to be group-writable or world-writable, correct its permission with the following command: 
# 
# # chmod go-w [FILE]   
# 
# CCI: CCI-001499
# 
###################################################

#!/bin/bash

find -L /bin -perm /022
find -L /usr/bin -perm /022
find -L /usr/local/bin -perm /022
find -L /sbin -perm /022
find -L /usr/sbin -perm /022
find -L /usr/local/sbin -perm /022

