###################################################
# 
# Group ID (Vulid):  V-38535
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50336r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000092
# Rule Title: The system must not respond to ICMPv4 sent to a broadcast address.
# 
# Vulnerability Discussion:  Ignoring ICMP echo requests (pings) sent to broadcast or multicast addresses makes the system slightly more difficult to enumerate on the network.
# 
# Check Content:  
# The status of the "net.ipv4.icmp_echo_ignore_broadcasts" kernel parameter can be queried by running the following command: 
# 
# $ sysctl net.ipv4.icmp_echo_ignore_broadcasts
# 
# The output of the command should indicate a value of "1". If this value is not the default value, investigate how it could have been adjusted at runtime, and verify it is not set improperly in "/etc/sysctl.conf". 
# If the correct value is not returned, this is a finding.
# 
# Fix Text: To set the runtime status of the "net.ipv4.icmp_echo_ignore_broadcasts" kernel parameter, run the following command: 
# 
# # sysctl -w net.ipv4.icmp_echo_ignore_broadcasts=1
# 
# If this is not the system's default value, add the following line to "/etc/sysctl.conf": 
# 
# net.ipv4.icmp_echo_ignore_broadcasts = 1   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

sysctl net.ipv4.icmp_echo_ignore_broadcasts
