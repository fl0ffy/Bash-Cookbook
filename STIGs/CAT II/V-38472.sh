###################################################
# 
# Group ID (Vulid):  V-38472
# Group Title:  SRG-OS-000259
# Rule ID:  SV-50272r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000048
# Rule Title: All system command files must be owned by root.
# 
# Vulnerability Discussion:  System binaries are executed by privileged users as well as system services, and restrictive permissions are necessary to ensure that their execution of these programs cannot be co-opted.
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
# All files in these directories should not be group-writable or world-writable. To find system executables that are not owned by "root", run the following command for each directory [DIR] which contains system executables: 
# 
# $ find -L [DIR] \! -user root
# 
# If any system executables are found to not be owned by root, this is a finding.
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
# If any file [FILE] in these directories is found to be owned by a user other than root, correct its ownership with the following command: 
# 
# # chown root [FILE]   
# 
# CCI: CCI-001499
# 
###################################################

#!/bin/bash

find -L /bin \! -user root
find -L /usr/bin \! -user root
find -L /usr/local/bin \! -user root
find -L /sbin \! -user root
find -L /usr/sbin \! -user root
find -L /usr/local/sbin \! -user root

