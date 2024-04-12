###################################################
# 
# Group ID (Vulid):  V-38600
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50401r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000080
# Rule Title: The system must not send ICMPv4 redirects by default.
# 
# Vulnerability Discussion:  Sending ICMP redirects permits the system to instruct other systems to update their routing information. The ability to send ICMP redirects is only appropriate for routers.
# 
# Check Content:  
# The status of the "net.ipv4.conf.default.send_redirects" kernel parameter can be queried by running the following command: 
# 
# $ sysctl net.ipv4.conf.default.send_redirects
# 
# The output of the command should indicate a value of "0". If this value is not the default value, investigate how it could have been adjusted at runtime, and verify it is not set improperly in "/etc/sysctl.conf". 
# If the correct value is not returned, this is a finding.
# 
# Fix Text: To set the runtime status of the "net.ipv4.conf.default.send_redirects" kernel parameter, run the following command: 
# 
# # sysctl -w net.ipv4.conf.default.send_redirects=0
# 
# If this is not the system's default value, add the following line to "/etc/sysctl.conf": 
# 
# net.ipv4.conf.default.send_redirects = 0   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

sysctl net.ipv4.conf.default.send_redirects

sysctl -w net.ipv4.conf.default.send_redirects=0

