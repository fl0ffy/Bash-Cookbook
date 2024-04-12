###################################################
# 
# Group ID (Vulid):  V-38495
# Group Title:  SRG-OS-000057
# Rule ID:  SV-50296r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000384
# Rule Title: Audit log files must be owned by root.
# 
# Vulnerability Discussion:  If non-privileged users can write to audit logs, audit trails can be modified or destroyed.
# 
# Check Content:  
# Run the following command to check the owner of the system audit logs: 
# 
# grep "^log_file" /etc/audit/auditd.conf|sed s/^[^\/]*//|xargs stat -c %U:%n
# 
# Audit logs must be owned by root. 
# If they are not, this is a finding.
# 
# Fix Text: Change the owner of the audit log files with the following command: 
# 
# # chown root [audit_file]   
# 
# CCI: CCI-000162
# 
###################################################

#!/bin/bash

grep "^log_file" /etc/audit/auditd.conf|sed s/^[^\/]*//|xargs stat -c %U:%n