###################################################
# 
# Group ID (Vulid):  V-38624
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50425r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000138
# Rule Title: System logs must be rotated daily.
# 
# Vulnerability Discussion:  Log files that are not properly rotated run the risk of growing so large that they fill up the /var/log partition. Valuable logging information could be lost if the /var/log partition becomes full.
# 
# Check Content:  
# Run the following commands to determine the current status of the "logrotate" service: 
# 
# # grep logrotate /var/log/cron*
# 
# If the logrotate service is not run on a daily basis by cron, this is a finding.
# 
# Fix Text: The "logrotate" service should be installed or reinstalled if it is not installed and operating properly, by running the following command:
# 
# # yum reinstall logrotate   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

grep logrotate /var/log/cron*