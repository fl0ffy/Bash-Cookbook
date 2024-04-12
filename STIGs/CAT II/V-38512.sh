###################################################
# 
# Group ID (Vulid):  V-38512
# Group Title:  SRG-OS-000146
# Rule ID:  SV-50313r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000117
# Rule Title: The operating system must prevent public IPv4 access into an organizations internal networks, except as appropriately mediated by managed interfaces employing boundary protection devices.
# 
# Vulnerability Discussion:  The "iptables" service provides the system's host-based firewalling capability for IPv4 and ICMP.
# 
# Check Content:  
# If the system is a cross-domain system, this is not applicable.
# 
# Run the following command to determine the current status of the "iptables" service: 
# 
# # service iptables status
# 
# If the service is enabled, it should return the following: 
# 
# iptables is running...
# 
# If the service is not running, this is a finding.
# 
# Fix Text: The "iptables" service can be enabled with the following command: 
# 
# # chkconfig iptables on   
# 
# CCI: CCI-001100
# 
###################################################

#!/bin/bash

service iptables status