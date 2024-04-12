###################################################
# 
# Group ID (Vulid):  V-38524
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50325r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000084
# Rule Title: The system must not accept ICMPv4 redirect packets on any interface.
# 
# Vulnerability Discussion:  Accepting ICMP redirects has few legitimate uses. It should be disabled unless it is absolutely required.
# 
# Check Content:  
# The status of the "net.ipv4.conf.all.accept_redirects" kernel parameter can be queried by running the following command: 
# 
# $ sysctl net.ipv4.conf.all.accept_redirects
# 
# The output of the command should indicate a value of "0". If this value is not the default value, investigate how it could have been adjusted at runtime, and verify it is not set improperly in "/etc/sysctl.conf". 
# If the correct value is not returned, this is a finding.
# 
# Fix Text: To set the runtime status of the "net.ipv4.conf.all.accept_redirects" kernel parameter, run the following command: 
# 
# # sysctl -w net.ipv4.conf.all.accept_redirects=0
# 
# If this is not the system's default value, add the following line to "/etc/sysctl.conf": 
# 
# net.ipv4.conf.all.accept_redirects = 0   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

sysctl net.ipv4.conf.all.accept_redirects

sysctl -w net.ipv4.conf.all.accept_redirects=0


echo "" >> /etc/sysctl.conf
echo '# Controls the use of ICMPv4 redirect packets >> /etc/sysctl.conf
echo 'net.ipv4.conf.all.accept_redirects = 0' >> /etc/sysctl.conf


sysctl -p /etc/sysctl.conf