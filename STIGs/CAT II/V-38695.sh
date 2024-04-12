###################################################
# 
# Group ID (Vulid):  V-38695
# Group Title:  SRG-OS-000094
# Rule ID:  SV-50496r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000302
# Rule Title: A file integrity tool must be used at least weekly to check for unauthorized file changes, particularly the addition of unauthorized system libraries or binaries, or for unauthorized modification to authorized system libraries or binaries.
# 
# Vulnerability Discussion:  By default, AIDE does not install itself for periodic execution. Periodically running AIDE may reveal unexpected changes in installed files.
# 
# Check Content:  
# To determine that periodic AIDE execution has been scheduled, run the following command: 
# 
# # grep aide /etc/crontab
# 
# If there is no output or if aide is not run at least weekly, this is a finding.
# 
# Fix Text: AIDE should be executed on a periodic basis to check for changes. To implement a daily execution of AIDE at 4:05am using cron, add the following line to /etc/crontab: 
# 
# 05 4 * * * root /usr/sbin/aide --check
# 
# AIDE can be executed periodically through other means; this is merely one example.   
# 
# CCI: CCI-000374
# 
###################################################

#!/bin/bash

grep aide /etc/crontab