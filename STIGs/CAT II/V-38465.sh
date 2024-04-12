# ###################################################
# 
# Group ID (Vulid):  V-38465
# Group Title:  SRG-OS-000259
# Rule ID:  SV-50265r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000045
# Rule Title: Library files must have mode 0755 or less permissive.
# 
# Vulnerability Discussion:  Files from shared library directories are loaded into the address space of processes (including privileged ones) or of the kernel itself at runtime. Restrictive permissions are necessary to protect the integrity of the system.
# 
# Check Content:  
# System-wide shared library files, which are linked to executables during process load time or run time, are stored in the following directories by default: 
# 
# /lib
# /lib64
# /usr/lib
# /usr/lib64
# 
# Kernel modules, which can be added to the kernel during runtime, are stored in "/lib/modules". All files in these directories should not be group-writable or world-writable. To find shared libraries that are group-writable or world-writable, run the following command for each directory [DIR] which contains shared libraries: 
# 
# $ find -L [DIR] -perm /022
# 
# If any of these files are group-writable or world-writable, this is a finding.
# 
# Fix Text: System-wide shared library files, which are linked to executables during process load time or run time, are stored in the following directories by default: 
# 
# /lib
# /lib64
# /usr/lib
# /usr/lib64
# 
# If any file in these directories is found to be group-writable or world-writeable correct its permission with the following command: 
# 
# # chmod go-w [FILE]   
# 
# CCI: CCI-001499
# 
###################################################

#!/bin/bash

find -L /lib -perm /022
find -L /lib64 -perm /022
find -L /usr/lib -perm /022
find -L /usr/lib64 -perm /022

