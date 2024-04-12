###################################################
# 
# Group ID (Vulid):  V-38511
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50312r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000082
# Rule Title: IP forwarding for IPv4 must not be enabled, unless the system is a router.
# 
# Vulnerability Discussion:  IP forwarding permits the kernel to forward packets from one network interface to another. The ability to forward packets between two networks is only appropriate for routers.
# 
# Check Content:  
# If the system serves as a router, this is not applicable.
# 
# The status of the "net.ipv4.ip_forward" kernel parameter can be queried by running the following command: 
# 
# $ sysctl net.ipv4.ip_forward
# 
# The output of the command should indicate a value of "0". If this value is not the default value, investigate how it could have been adjusted at runtime, and verify it is not set improperly in "/etc/sysctl.conf". 
# If the correct value is not returned, this is a finding.
# 
# Fix Text: To set the runtime status of the "net.ipv4.ip_forward" kernel parameter, run the following command: 
# 
# # sysctl -w net.ipv4.ip_forward=0
# 
# If this is not the system's default value, add the following line to "/etc/sysctl.conf": 
# 
# net.ipv4.ip_forward = 0   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

sysctl net.ipv4.ip_forward