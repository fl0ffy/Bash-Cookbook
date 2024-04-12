###################################################
# 
# Group ID (Vulid):  V-38464
# Group Title:  SRG-OS-000047
# Rule ID:  SV-50264r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000511
# Rule Title: The audit system must take appropriate action when there are disk errors on the audit storage volume.
# 
# Vulnerability Discussion:  Taking appropriate action in case of disk errors will minimize the possibility of losing audit records.
# 
# Check Content:  
# Inspect "/etc/audit/auditd.conf" and locate the following line to determine if the system is configured to take appropriate action when disk errors occur:
# 
# # grep disk_error_action /etc/audit/auditd.conf
# disk_error_action = [ACTION]
# 
# If the system is configured to "suspend" when disk errors occur or "ignore" them, this is a finding.
# 
# Fix Text: Edit the file "/etc/audit/auditd.conf". Modify the following line, substituting [ACTION] appropriately: 
# 
# disk_error_action = [ACTION]
# 
# Possible values for [ACTION] are described in the "auditd.conf" man page. These include: 
# 
# "ignore"
# "syslog"
# "exec"
# "suspend"
# "single"
# "halt"
# 
# Set this to "syslog", "exec", "single", or "halt".   
# 
# CCI: CCI-000140
# 
###################################################

#!/bin/bash

grep disk_error_action /etc/audit/auditd.conf

