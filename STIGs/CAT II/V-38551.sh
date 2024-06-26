###################################################
# 
# Group ID (Vulid):  V-38551
# Group Title:  SRG-OS-000145
# Rule ID:  SV-50352r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000106
# Rule Title: The operating system must connect to external networks or information systems only through managed IPv6 interfaces consisting of boundary protection devices arranged in accordance with an organizational security architecture.
# 
# Vulnerability Discussion:  The "ip6tables" service provides the system's host-based firewalling capability for IPv6 and ICMPv6.
# 
# Check Content:  
# If IPv6 is disabled, this is not applicable.
# 
# Run the following command to determine the current status of the "ip6tables" service: 
# 
# # service ip6tables status
# 
# If the service is enabled, it should return the following: 
# 
# ip6tables is running...
# 
# If the service is not running, this is a finding.
# 
# Fix Text: The "ip6tables" service can be enabled with the following command: 
# 
# # chkconfig ip6tables on   
# 
# CCI: CCI-001098
# 
###################################################

#!/bin/bash

