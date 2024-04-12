###################################################
# 
# Group ID (Vulid):  V-38636
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50437r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000159
# Rule Title: The system must retain enough rotated audit logs to cover the required log retention period.
# 
# Vulnerability Discussion:  The total storage for audit log files must be large enough to retain log information over the period required. This is a function of the maximum log file size and the number of logs retained.
# 
# Check Content:  
# Inspect "/etc/audit/auditd.conf" and locate the following line to determine how many logs the system is configured to retain after rotation: "# grep num_logs /etc/audit/auditd.conf" 
# 
# num_logs = 5
# 
# If the overall system log file(s) retention hasn't been properly set up, this is a finding.
# 
# Fix Text: Determine how many log files "auditd" should retain when it rotates logs. Edit the file "/etc/audit/auditd.conf". Add or modify the following line, substituting [NUMLOGS] with the correct value: 
# 
# num_logs = [NUMLOGS]
# 
# Set the value to 5 for general-purpose systems. Note that values less than 2 result in no log rotation.   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

grep num_logs /etc/audit/auditd.conf