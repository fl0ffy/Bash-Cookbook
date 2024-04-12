###################################################
# 
# Group ID (Vulid):  V-38575
# Group Title:  SRG-OS-000064
# Rule ID:  SV-50376r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000200
# Rule Title: The audit system must be configured to audit user deletions of files and programs.
# 
# Vulnerability Discussion:  Auditing file deletions will create an audit trail for files that are removed from the system. The audit trail could aid in system troubleshooting, as well as detecting malicious processes that attempt to delete log files to conceal their presence.
# 
# Check Content:  
# To determine if the system is configured to audit calls to the "unlink" system call, run the following command: 
# 
# # auditctl -l | grep syscall | grep unlink | grep -v unlinkat
# 
# If the system is configured to audit this activity, it will return several lines. 
# To determine if the system is configured to audit calls to the "unlinkat" system call, run the following command: 
# 
# # auditctl -l | grep syscall | grep unlinkat
# 
# If the system is configured to audit this activity, it will return several lines. To determine if the system is configured to audit calls to the "rename" system call, run the following command: 
# 
# # auditctl -l | grep syscall | grep rename | grep -v renameat
# 
# If the system is configured to audit this activity, it will return several lines. To determine if the system is configured to audit calls to the "renameat" system call, run the following command: 
# 
# # auditctl -l | grep syscall | grep renameat
# 
# If the system is configured to audit this activity, it will return several lines. 
# If no line is returned, this is a finding.
# 
# Fix Text: At a minimum, the audit system should collect file deletion events for all users and root. Add the following to "/etc/audit/audit.rules", setting ARCH to either b32 or b64 as appropriate for your system: 
# 
# -a always,exit -F arch=ARCH -S unlink -S unlinkat -S rename -S renameat \
# -F auid>=500 -F auid!=4294967295 -k delete
# -a always,exit -F arch=ARCH -S unlink -S unlinkat -S rename -S renameat \
# -F auid==0 -k delete   
# 
# CCI: CCI-000172
# 
###################################################

#!/bin/bash

auditctl -l | grep syscall | grep unlink | grep -v unlinkat
auditctl -l | grep syscall | grep unlinkat
auditctl -l | grep syscall | grep rename | grep -v renameat
auditctl -l | grep syscall | grep renameat

echo "" >> /etc/audit/audit.rules
echo '#delete' >> /etc/audit/audit.rules
echo '-a always,exit -F arch=ARCH -S unlink -S unlinkat -S rename -S renameat -F auid>=500 -F auid!=4294967295 -k delete' >> /etc/audit/audit.rules
echo '-a always,exit -F arch=ARCH -S unlink -S unlinkat -S rename -S renameat -F auid==0 -k delete ' >> /etc/audit/audit.rules