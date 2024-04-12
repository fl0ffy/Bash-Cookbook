###################################################
# 
# Group ID (Vulid):  V-38702
# Group Title:  SRG-OS-000037
# Rule ID:  SV-50503r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000339
# Rule Title: The FTP daemon must be configured for logging or verbose mode.
# 
# Vulnerability Discussion:  To trace malicious activity facilitated by the FTP service, it must be configured to ensure that all commands sent to the ftp server are logged using the verbose vsftpd log format. The default vsftpd log file is /var/log/vsftpd.log.
# 
# Check Content:  
# Find if logging is applied to the ftp daemon. 
# 
# Procedures: 
# 
# If vsftpd is started by xinetd the following command will indicate the xinetd.d startup file. 
# 
# # grep vsftpd /etc/xinetd.d/*
# 
# # grep server_args [vsftpd xinetd.d startup file]
# 
# This will indicate the vsftpd config file used when starting through xinetd. If the [server_args]line is missing or does not include the vsftpd configuration file, then the default config file (/etc/vsftpd/vsftpd.conf) is used. 
# 
# # grep xferlog_enable [vsftpd config file]
# 
# If xferlog_enable is missing, or is not set to yes, this is a finding.
# 
# Fix Text: Add or correct the following configuration options within the "vsftpd" configuration file, located at "/etc/vsftpd/vsftpd.conf". 
# 
# xferlog_enable=YES
# xferlog_std_format=NO
# log_ftp_protocol=YES   
# 
# CCI: CCI-000130
# 
###################################################

#!/bin/bash

grep vsftpd /etc/xinetd.d/*
grep server_args [vsftpd xinetd.d startup file]
grep xferlog_enable [vsftpd config file]