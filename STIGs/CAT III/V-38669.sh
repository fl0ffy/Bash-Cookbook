###################################################
# 
# Group ID (Vulid):  V-38669
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50470r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000287
# Rule Title: The postfix service must be enabled for mail delivery.
# 
# Vulnerability Discussion:  Local mail delivery is essential to some system maintenance and notification tasks.
# 
# Check Content:  
# Run the following command to determine the current status of the "postfix" service:
# 
# # service postfix status
# 
# If the service is enabled, it should return the following:
# 
# postfix is running...
# 
# If the service is not enabled, this is a finding.
# 
# Fix Text: The Postfix mail transfer agent is used for local mail delivery within the system. The default configuration only listens for connections to the default SMTP port (port 25) on the loopback interface (127.0.0.1). It is recommended to leave this service enabled for local mail delivery. The "postfix" service can be enabled with the following command: 
# 
# # chkconfig postfix on
# # service postfix start   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

service postfix status