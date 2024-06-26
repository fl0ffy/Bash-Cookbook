###################################################
# 
# Group ID (Vulid):  V-38547
# Group Title:  SRG-OS-000064
# Rule ID:  SV-50348r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000186
# Rule Title: The audit system must be configured to audit all discretionary access control permission modifications using fchmod.
# 
# Vulnerability Discussion:  The changing of file permissions could indicate that a user is attempting to gain access to information that would otherwise be disallowed. Auditing DAC modifications can facilitate the identification of patterns of abuse among both authorized and unauthorized users.
# 
# Check Content:  
# To determine if the system is configured to audit calls to the "fchmod" system call, run the following command: 
# 
# # auditctl -l | grep syscall | grep fchmod
# 
# If the system is configured to audit this activity, it will return several lines. 
# If no lines are returned, this is a finding.
# 
# Fix Text: At a minimum, the audit system should collect file permission changes for all users and root. Add the following to "/etc/audit/audit.rules": 
# 
# -a always,exit -F arch=b32 -S fchmod -F auid>=500 -F auid!=4294967295 \
# -k perm_mod
# -a always,exit -F arch=b32 -S fchmod -F auid==0 -k perm_mod
# 
# If the system is 64-bit, then also add the following: 
# 
# -a always,exit -F arch=b64 -S fchmod -F auid>=500 -F auid!=4294967295 \
# -k perm_mod
# -a always,exit -F arch=b64 -S fchmod -F auid==0 -k perm_mod   
# 
# CCI: CCI-000172
# 
###################################################

#!/bin/bash

auditctl -l | grep syscall | grep fchmod

echo "" >> /etc/audit/audit.rules
echo '# perm_mod' >> /etc/audit/audit.rules
echo '-a always,exit -F arch=b64 -S fchmod -F auid>=500 -F auid!=4294967295 \ -k perm_mod' >> /etc/audit/audit.rules
echo '-a always,exit -F arch=b64 -S fchmod -F auid==0 -k perm_mod' >> /etc/audit/audit.rules