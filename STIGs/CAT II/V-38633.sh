###################################################
# 
# Group ID (Vulid):  V-38633
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50434r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000160
# Rule Title: The system must set a maximum audit log file size.
# 
# Vulnerability Discussion:  The total storage for audit log files must be large enough to retain log information over the period required. This is a function of the maximum log file size and the number of logs retained.
# 
# Check Content:  
# Inspect "/etc/audit/auditd.conf" and locate the following line to determine how much data the system will retain in each audit log file: "# grep max_log_file /etc/audit/auditd.conf" 
# 
# max_log_file = 6
# 
# If the system audit data threshold hasn't been properly set up, this is a finding.
# 
# Fix Text: Determine the amount of audit data (in megabytes) which should be retained in each log file. Edit the file "/etc/audit/auditd.conf". Add or modify the following line, substituting the correct value for [STOREMB]: 
# 
# max_log_file = [STOREMB]
# 
# Set the value to "6" (MB) or higher for general-purpose systems. Larger values, of course, support retention of even more audit data.   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

grep max_log_file /etc/audit/auditd.conf