###################################################
# 
# Group ID (Vulid):  V-38468
# Group Title:  SRG-OS-000047
# Rule ID:  SV-50268r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000510
# Rule Title: The audit system must take appropriate action when the audit storage volume is full.
# 
# Vulnerability Discussion:  Taking appropriate action in case of a filled audit storage volume will minimize the possibility of losing audit records.
# 
# Check Content:  
# Inspect "/etc/audit/auditd.conf" and locate the following line to determine if the system is configured to take appropriate action when the audit storage volume is full:
# 
# # grep disk_full_action /etc/audit/auditd.conf
# disk_full_action = [ACTION]
# 
# If the system is configured to "suspend" when the volume is full or "ignore" that it is full, this is a finding.
# 
# Fix Text: The "auditd" service can be configured to take an action when disk space starts to run low. Edit the file "/etc/audit/auditd.conf". Modify the following line, substituting [ACTION] appropriately: 
# 
# disk_full_action = [ACTION]
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

grep disk_full_action /etc/audit/auditd.conf