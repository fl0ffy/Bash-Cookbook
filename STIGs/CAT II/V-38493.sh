###################################################
# 
# Group ID (Vulid):  V-38493
# Group Title:  SRG-OS-000059
# Rule ID:  SV-50294r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000385
# Rule Title: Audit log directories must have mode 0755 or less permissive.
# 
# Vulnerability Discussion:  If users can delete audit logs, audit trails can be modified or destroyed.
# 
# Check Content:  
# Run the following command to check the mode of the system audit directories: 
# 
# grep "^log_file" /etc/audit/auditd.conf|sed 's/^[^/]*//; s/[^/]*$//'|xargs stat -c %a:%n
# 
# Audit directories must be mode 0755 or less permissive. 
# If any are more permissive, this is a finding.
# 
# Fix Text: Change the mode of the audit log directories with the following command: 
# 
# # chmod go-w [audit_directory]   
# 
# CCI: CCI-000164
# 
###################################################

#!/bin/bash

grep "^log_file" /etc/audit/auditd.conf|sed 's/^[^/]*//; s/[^/]*$//'|xargs stat -c %a:%n