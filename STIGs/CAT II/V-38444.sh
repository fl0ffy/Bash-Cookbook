# ###################################################
# 
# Group ID (Vulid):  V-38444
# Group Title:  SRG-OS-000231
# Rule ID:  SV-50244r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000523
# Rule Title: The systems local IPv6 firewall must implement a deny-all, allow-by-exception policy for inbound packets.
# 
# Vulnerability Discussion:  In "ip6tables" the default policy is applied only after all the applicable rules in the table are examined for a match. Setting the default policy to "DROP" implements proper design for a firewall, i.e., any packets which are not explicitly permitted should not be accepted.
# 
# Check Content:  
# Inspect the file "/etc/sysconfig/ip6tables" to determine the default policy for the INPUT chain. It should be set to DROP. 
# 
# # grep ":INPUT" /etc/sysconfig/ip6tables
# 
# If the default policy for the INPUT chain is not set to DROP, this is a finding.
# 
# Fix Text: To set the default policy to DROP (instead of ACCEPT) for the built-in INPUT chain which processes incoming packets, add or correct the following line in "/etc/sysconfig/ip6tables": 
# 
# :INPUT DROP [0:0]   
# 
# CCI: CCI-000066
# 
###################################################

#!/bin/bash

grep ":INPUT" /etc/sysconfig/ip6tables

sed -i 's/ :INPUT ACCEPT [0:0]/ :INPUT DROP [0:0]/' /etc/sysconfig/ip6tables