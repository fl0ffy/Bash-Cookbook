###################################################
# 
# Group ID (Vulid):  V-38533
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50334r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000091
# Rule Title: The system must ignore IPv4 ICMP redirect messages.
# 
# Vulnerability Discussion:  This feature of the IPv4 protocol has few legitimate uses. It should be disabled unless it is absolutely required.
# 
# Check Content:  
# The status of the "net.ipv4.conf.default.accept_redirects" kernel parameter can be queried by running the following command: 
# 
# $ sysctl net.ipv4.conf.default.accept_redirects
# 
# The output of the command should indicate a value of "0". If this value is not the default value, investigate how it could have been adjusted at runtime, and verify it is not set improperly in "/etc/sysctl.conf". 
# If the correct value is not returned, this is a finding.
# 
# Fix Text: To set the runtime status of the "net.ipv4.conf.default.accept_redirects" kernel parameter, run the following command: 
# 
# # sysctl -w net.ipv4.conf.default.accept_redirects=0
# 
# If this is not the system's default value, add the following line to "/etc/sysctl.conf": 
# 
# net.ipv4.conf.default.accept_redirects = 0   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

sysctl net.ipv4.conf.default.accept_redirects

sysctl -w net.ipv4.conf.default.accept_redirects=0