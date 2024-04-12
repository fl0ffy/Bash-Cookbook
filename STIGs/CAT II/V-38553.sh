###################################################
# 
# Group ID (Vulid):  V-38553
# Group Title:  SRG-OS-000146
# Rule ID:  SV-50354r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000107
# Rule Title: The operating system must prevent public IPv6 access into an organizations internal networks, except as appropriately mediated by managed interfaces employing boundary protection devices.
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
# CCI: CCI-001100
# 
###################################################

#!/bin/bash

service ip6tables status