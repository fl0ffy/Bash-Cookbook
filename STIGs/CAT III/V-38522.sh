###################################################
# 
# Group ID (Vulid):  V-38522
# Group Title:  SRG-OS-000062
# Rule ID:  SV-50323r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000167
# Rule Title: The audit system must be configured to audit all attempts to alter system time through settimeofday.
# 
# Vulnerability Discussion:  Arbitrary changes to the system time can be used to obfuscate nefarious activities in log files, as well as to confuse network services that are highly dependent upon an accurate system time (such as sshd). All changes to the system time should be audited.
# 
# Check Content:  
# To determine if the system is configured to audit calls to the "settimeofday" system call, run the following command: 
# 
# # auditctl -l | grep syscall | grep settimeofday
# 
# If the system is configured to audit this activity, it will return a line. 
# If the system is not configured to audit time changes, this is a finding.
# 
# Fix Text: On a 32-bit system, add the following to "/etc/audit/audit.rules": 
# 
# # audit_time_rules
# -a always,exit -F arch=b32 -S settimeofday -k audit_time_rules
# 
# On a 64-bit system, add the following to "/etc/audit/audit.rules": 
# 
# # audit_time_rules
# -a always,exit -F arch=b64 -S settimeofday -k audit_time_rules
# 
# The -k option allows for the specification of a key in string form that can be used for better reporting capability through ausearch and aureport. Multiple system calls can be defined on the same line to save space if desired, but is not required. See an example of multiple combined syscalls: 
# 
# -a always,exit -F arch=b64 -S adjtimex -S settimeofday -S clock_settime 
# -k audit_time_rules   
# 
# CCI: CCI-000169
# 
###################################################

#!/bin/bash

auditctl -l | grep syscall | grep settimeofday

echo "" >> /etc/audit/audit.rules
echo '# audit_time_rules' >> /etc/audit/audit.rules
echo '-a always,exit -F arch=b64 -S settimeofday -k audit_time_rules' >> /etc/audit/audit.rules