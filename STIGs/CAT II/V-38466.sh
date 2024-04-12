###################################################
# 
# Group ID (Vulid):  V-38466
# Group Title:  SRG-OS-000259
# Rule ID:  SV-50266r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000046
# Rule Title: Library files must be owned by root.
# 
# Vulnerability Discussion:  Files from shared library directories are loaded into the address space of processes (including privileged ones) or of the kernel itself at runtime. Proper ownership is necessary to protect the integrity of the system.
# 
# Check Content:  
# System-wide shared library files, which are linked to executables during process load time or run time, are stored in the following directories by default: 
# 
# /lib
# /lib64
# /usr/lib
# /usr/lib64
# 
# Kernel modules, which can be added to the kernel during runtime, are stored in "/lib/modules". All files in these directories should not be group-writable or world-writable. To find shared libraries that are not owned by "root", run the following command for each directory [DIR] which contains shared libraries: 
# 
# $ find -L [DIR] \! -user root
# 
# If any of these files are not owned by root, this is a finding.
# 
# Fix Text: System-wide shared library files, which are linked to executables during process load time or run time, are stored in the following directories by default: 
# 
# /lib
# /lib64
# /usr/lib
# /usr/lib64
# 
# If any file in these directories is found to be owned by a user other than root, correct its ownership with the following command: 
# 
# # chown root [FILE]   
# 
# CCI: CCI-001499
# 
###################################################

#!/bin/bash


find -L /lib \! -user root
find -L /lib64 \! -user root
find -L /usr/lib \! -user root
find -L /usr/lib64 \! -user root

