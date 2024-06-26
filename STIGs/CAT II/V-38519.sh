# ###################################################
# 
# Group ID (Vulid):  V-38519
# Group Title:  SRG-OS-000206
# Rule ID:  SV-50320r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000134
# Rule Title: All rsyslog-generated log files must be group-owned by root.
# 
# Vulnerability Discussion:  The log files generated by rsyslog contain valuable information regarding system configuration, user authentication, and other such information. Log files should be protected from unauthorized access.
# 
# Check Content:  
# The group-owner of all log files written by "rsyslog" should be root. These log files are determined by the second part of each Rule line in "/etc/rsyslog.conf" and typically all appear in "/var/log". For each log file [LOGFILE] referenced in "/etc/rsyslog.conf", run the following command to inspect the file's group owner: 
# 
# $ ls -l [LOGFILE]
# 
# If the group-owner is not root, this is a finding.
# 
# Fix Text: The group-owner of all log files written by "rsyslog" should be root. These log files are determined by the second part of each Rule line in "/etc/rsyslog.conf" and typically all appear in "/var/log". For each log file [LOGFILE] referenced in "/etc/rsyslog.conf", run the following command to inspect the file's group owner:
# 
# $ ls -l [LOGFILE]
# 
# If the owner is not "root", run the following command to correct this:
# 
# # chgrp root [LOGFILE]   
# 
# CCI: CCI-001314
# 
###################################################

#!/bin/bash

less /etc/rsyslog.conf
ls -l [LOGFILE]

