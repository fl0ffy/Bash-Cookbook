###################################################
# 
# Group ID (Vulid):  V-38620
# Group Title:  SRG-OS-000056
# Rule ID:  SV-50421r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000247
# Rule Title: The system clock must be synchronized continuously, or at least daily.
# 
# Vulnerability Discussion:  Enabling the "ntpd" service ensures that the "ntpd" service will be running and that the system will synchronize its time to any servers specified. This is important whether the system is configured to be a client (and synchronize only its own clock) or it is also acting as an NTP server to other systems. Synchronizing time is essential for authentication services such as Kerberos, but it is also important for maintaining accurate logs and auditing possible security breaches.
# 
# Check Content:  
# Run the following command to determine the current status of the "ntpd" service: 
# 
# # service ntpd status
# 
# If the service is enabled, it should return the following: 
# 
# ntpd is running...
# 
# If the service is not running, this is a finding.
# 
# Fix Text: The "ntpd" service can be enabled with the following command: 
# 
# # chkconfig ntpd on
# # service ntpd start   
# 
# CCI: CCI-000160
# 
###################################################

#!/bin/bash

service ntpd status