###################################################
# 
# Group ID (Vulid):  V-38549
# Group Title:  SRG-OS-000152
# Rule ID:  SV-50350r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000103
# Rule Title: The system must employ a local IPv6 firewall.
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
# CCI: CCI-001118
# 
###################################################

#!/bin/bash

service ip6tables status