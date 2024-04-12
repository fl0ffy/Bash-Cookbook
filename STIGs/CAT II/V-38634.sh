###################################################
# 
# Group ID (Vulid):  V-38634
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50435r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000161
# Rule Title: The system must rotate audit log files that reach the maximum file size.
# 
# Vulnerability Discussion:  Automatically rotating logs (by setting this to "rotate") minimizes the chances of the system unexpectedly running out of disk space by being overwhelmed with log data. However, for systems that must never discard log data, or which use external processes to transfer it and reclaim space, "keep_logs" can be employed.
# 
# Check Content:  
# Inspect "/etc/audit/auditd.conf" and locate the following line to determine if the system is configured to rotate logs when they reach their maximum size: "# grep max_log_file_action /etc/audit/auditd.conf" 
# 
# max_log_file_action "rotate"
# 
# If the system has not been properly set up to rotate audit logs, this is a finding.
# 
# Fix Text: The default action to take when the logs reach their maximum size is to rotate the log files, discarding the oldest one. To configure the action taken by "auditd", add or correct the line in "/etc/audit/auditd.conf": 
# 
# max_log_file_action = [ACTION]
# 
# Possible values for [ACTION] are described in the "auditd.conf" man page. These include: 
# 
# "ignore"
# "syslog"
# "suspend"
# "rotate"
# "keep_logs"
# 
# Set the "[ACTION]" to "rotate" to ensure log rotation occurs. This is the default. The setting is case-insensitive.   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

grep max_log_file_action /etc/audit/auditd.conf
