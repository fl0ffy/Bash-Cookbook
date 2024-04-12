###################################################
# 
# Group ID (Vulid):  V-38623
# Group Title:  SRG-OS-000206
# Rule ID:  SV-50424r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000135
# Rule Title: All rsyslog-generated log files must have mode 0600 or less permissive.
# 
# Vulnerability Discussion:  Log files can contain valuable information regarding system configuration. If the system log files are not protected, unauthorized users could change the logged data, eliminating their forensic value.
# 
# Check Content:  
# The file permissions for all log files written by rsyslog should be set to 600, or more restrictive. These log files are determined by the second part of each Rule line in "/etc/rsyslog.conf" and typically all appear in "/var/log". For each log file [LOGFILE] referenced in "/etc/rsyslog.conf", run the following command to inspect the file's permissions: 
# 
# $ ls -l [LOGFILE]
# 
# The permissions should be 600, or more restrictive. 
# If the permissions are not correct, this is a finding.
# 
# Fix Text: The file permissions for all log files written by rsyslog should be set to 600, or more restrictive. These log files are determined by the second part of each Rule line in "/etc/rsyslog.conf" and typically all appear in "/var/log". For each log file [LOGFILE] referenced in "/etc/rsyslog.conf", run the following command to inspect the file's permissions:
# 
# $ ls -l [LOGFILE]
# 
# If the permissions are not 600 or more restrictive, run the following command to correct this:
# 
# # chmod 0600 [LOGFILE]   
# 
# CCI: CCI-001314
# 
###################################################

#!/bin/bash

ls -l [LOGFILE]

chmod 0600 [LOGFILE]