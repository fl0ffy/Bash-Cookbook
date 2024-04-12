###################################################
# 
# Group ID (Vulid):  V-38599
# Group Title:  SRG-OS-000023
# Rule ID:  SV-50400r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000348
# Rule Title: The FTPS/FTP service on the system must be configured with the Department of Defense (DoD) login banner.
# 
# Vulnerability Discussion:  This setting will cause the system greeting banner to be used for FTP connections as well.
# 
# Check Content:  
# To verify this configuration, run the following command: 
# 
# grep "banner_file" /etc/vsftpd/vsftpd.conf
# 
# The output should show the value of "banner_file" is set to "/etc/issue", an example of which is shown below. 
# 
# # grep "banner_file" /etc/vsftpd/vsftpd.conf
# banner_file=/etc/issue
# 
# If it does not, this is a finding.
# 
# Fix Text: Edit the vsftpd configuration file, which resides at "/etc/vsftpd/vsftpd.conf" by default. Add or correct the following configuration options. 
# 
# banner_file=/etc/issue   
# 
# CCI: CCI-000048
# 
###################################################

#!/bin/bash

grep "banner_file" /etc/vsftpd/vsftpd.conf