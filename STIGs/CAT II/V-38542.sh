###################################################
# 
# Group ID (Vulid):  V-38542
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50343r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000096
# Rule Title: The system must use a reverse-path filter for IPv4 network traffic when possible on all interfaces.
# 
# Vulnerability Discussion:  Enabling reverse path filtering drops packets with source addresses that should not have been able to be received on the interface they were received on. It should not be used on systems which are routers for complicated networks, but is helpful for end hosts and routers serving small networks.
# 
# Check Content:  
# The status of the "net.ipv4.conf.all.rp_filter" kernel parameter can be queried by running the following command: 
# 
# $ sysctl net.ipv4.conf.all.rp_filter
# 
# The output of the command should indicate a value of "1". If this value is not the default value, investigate how it could have been adjusted at runtime, and verify it is not set improperly in "/etc/sysctl.conf". 
# If the correct value is not returned, this is a finding.
# 
# Fix Text: To set the runtime status of the "net.ipv4.conf.all.rp_filter" kernel parameter, run the following command: 
# 
# # sysctl -w net.ipv4.conf.all.rp_filter=1
# 
# If this is not the system's default value, add the following line to "/etc/sysctl.conf": 
# 
# net.ipv4.conf.all.rp_filter = 1   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

sysctl net.ipv4.conf.all.rp_filter

sysctl -w net.ipv4.conf.all.rp_filter=1