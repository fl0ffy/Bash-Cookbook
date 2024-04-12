###################################################
# 
# Group ID (Vulid):  V-38445
# Group Title:  SRG-OS-000057
# Rule ID:  SV-50245r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000522
# Rule Title: Audit log files must be group-owned by root.
# 
# Vulnerability Discussion:  If non-privileged users can write to audit logs, audit trails can be modified or destroyed.
# 
# Check Content:  
# Run the following command to check the group owner of the system audit logs: 
# 
# grep "^log_file" /etc/audit/auditd.conf|sed s/^[^\/]*//|xargs stat -c %G:%n
# 
# Audit logs must be group-owned by root. 
# If they are not, this is a finding.
# 
# Fix Text: Change the group owner of the audit log files with the following command: 
# 
# # chgrp root [audit_file]
# 
#  
###################################################

#!/bin/bash

grep "^log_file" /etc/audit/auditd.conf|sed s/^[^\/]*//|xargs stat -c %G:%n

