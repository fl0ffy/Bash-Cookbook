###################################################
# 
# Group ID (Vulid):  V-38580
# Group Title:  SRG-OS-000064
# Rule ID:  SV-50381r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000202
# Rule Title: The audit system must be configured to audit the loading and unloading of dynamic kernel modules.
# 
# Vulnerability Discussion:  The addition/removal of kernel modules can be used to alter the behavior of the kernel and potentially introduce malicious code into kernel space. It is important to have an audit trail of modules that have been introduced into the kernel.
# 
# Check Content:  
# To determine if the system is configured to audit calls to the "init_module" system call, run the following command: 
# 
# # auditctl -l | grep syscall | grep init_module
# 
# If the system is configured to audit this activity, it will return a line. To determine if the system is configured to audit calls to the "delete_module" system call, run the following command: 
# 
# # auditctl -l | grep syscall | grep delete_module
# 
# If the system is configured to audit this activity, it will return a line. 
# If no line is returned, this is a finding.
# 
# Fix Text: Add the following to "/etc/audit/audit.rules" in order to capture kernel module loading and unloading events, setting ARCH to either b32 or b64 as appropriate for your system: 
# 
# -w /sbin/insmod -p x -k modules
# -w /sbin/rmmod -p x -k modules
# -w /sbin/modprobe -p x -k modules
# -a always,exit -F arch=[ARCH] -S init_module -S delete_module -k modules   
# 
# CCI: CCI-000172
# 
###################################################

#!/bin/bash

auditctl -l | grep syscall | grep init_module
auditctl -l | grep syscall | grep delete_module


ehco '-w /sbin/insmod -p x -k modules' >> /etc/audit/audit.rules
echo '-w /sbin/rmmod -p x -k modules' >> /etc/audit/audit.rules
echo '-w /sbin/modprobe -p x -k modules' >> /etc/audit/audit.rules
echo '-a always,exit -F arch=b64 -S init_module -S delete_module -k modules' >> /etc/audit/audit.rules