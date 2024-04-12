###################################################
# 
# Group ID (Vulid):  V-38498
# Group Title:  SRG-OS-000058
# Rule ID:  SV-50299r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000383
# Rule Title: Audit log files must have mode 0640 or less permissive.
# 
# Vulnerability Discussion:  If users can write to audit logs, audit trails can be modified or destroyed.
# 
# Check Content:  
# Run the following command to check the mode of the system audit logs: 
# 
# grep "^log_file" /etc/audit/auditd.conf|sed s/^[^\/]*//|xargs stat -c %a:%n
# 
# Audit logs must be mode 0640 or less permissive. 
# If any are more permissive, this is a finding.
# 
# Fix Text: Change the mode of the audit log files with the following command: 
# 
# # chmod 0640 [audit_file]   
# 
# CCI: CCI-000163
# 
###################################################

#!/bin/bash

grep "^log_file" /etc/audit/auditd.conf|sed s/^[^\/]*//|xargs stat -c %a:%n