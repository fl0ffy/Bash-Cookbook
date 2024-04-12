###################################################
# 
# Group ID (Vulid):  V-38698
# Group Title:  SRG-OS-000232
# Rule ID:  SV-50499r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000304
# Rule Title: The operating system must employ automated mechanisms to detect the presence of unauthorized software on organizational information systems and notify designated organizational officials in accordance with the organization defined frequency.
# 
# Vulnerability Discussion:  By default, AIDE does not install itself for periodic execution. Periodically running AIDE may reveal unexpected changes in installed files.
# 
# Check Content:  
# To determine that periodic AIDE execution has been scheduled, run the following command: 
# 
# # grep aide /etc/crontab
# 
# If there is no output, this is a finding.
# 
# Fix Text: AIDE should be executed on a periodic basis to check for changes. To implement a daily execution of AIDE at 4:05am using cron, add the following line to /etc/crontab: 
# 
# 05 4 * * * root /usr/sbin/aide --check
# 
# AIDE can be executed periodically through other means; this is merely one example.   
# 
# CCI: CCI-001069
# 
###################################################

#!/bin/bash

grep aide /etc/crontab