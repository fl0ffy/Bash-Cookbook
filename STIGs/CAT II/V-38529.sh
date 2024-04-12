###################################################
# 
# Group ID (Vulid):  V-38529
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50330r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000089
# Rule Title: The system must not accept IPv4 source-routed packets by default.
# 
# Vulnerability Discussion:  Accepting source-routed packets in the IPv4 protocol has few legitimate uses. It should be disabled unless it is absolutely required.
# 
# Check Content:  
# The status of the "net.ipv4.conf.default.accept_source_route" kernel parameter can be queried by running the following command: 
# 
# $ sysctl net.ipv4.conf.default.accept_source_route
# 
# The output of the command should indicate a value of "0". If this value is not the default value, investigate how it could have been adjusted at runtime, and verify it is not set improperly in "/etc/sysctl.conf". 
# If the correct value is not returned, this is a finding.
# 
# Fix Text: To set the runtime status of the "net.ipv4.conf.default.accept_source_route" kernel parameter, run the following command: 
# 
# # sysctl -w net.ipv4.conf.default.accept_source_route=0
# 
# If this is not the system's default value, add the following line to "/etc/sysctl.conf": 
# 
# net.ipv4.conf.default.accept_source_route = 0   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

sysctl net.ipv4.conf.default.accept_source_route