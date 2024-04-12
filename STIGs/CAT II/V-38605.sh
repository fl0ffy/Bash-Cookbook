###################################################
# 
# Group ID (Vulid):  V-38605
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50406r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000224
# Rule Title: The cron service must be running.
# 
# Vulnerability Discussion:  Due to its usage for maintenance and security-supporting tasks, enabling the cron daemon is essential.
# 
# Check Content:  
# Run the following command to determine the current status of the "crond" service: 
# 
# # service crond status
# 
# If the service is enabled, it should return the following: 
# 
# crond is running...
# 
# If the service is not running, this is a finding.
# 
# Fix Text: The "crond" service is used to execute commands at preconfigured times. It is required by almost all systems to perform necessary maintenance tasks, such as notifying root of system activity. The "crond" service can be enabled with the following command: 
# 
# # chkconfig crond on   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

service crond status