###################################################
# 
# Group ID (Vulid):  V-38612
# Group Title:  SRG-OS-000106
# Rule ID:  SV-50413r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000236
# Rule Title: The SSH daemon must not allow host-based authentication.
# 
# Vulnerability Discussion:  SSH trust relationships mean a compromise on one host can allow an attacker to move trivially to other hosts.
# 
# Check Content:  
# To determine how the SSH daemon's "HostbasedAuthentication" option is set, run the following command: 
# 
# # grep -i HostbasedAuthentication /etc/ssh/sshd_config
# 
# If no line, a commented line, or a line indicating the value "no" is returned, then the required value is set. 
# If the required value is not set, this is a finding.
# 
# Fix Text: SSH's cryptographic host-based authentication is more secure than ".rhosts" authentication, since hosts are cryptographically authenticated. However, it is not recommended that hosts unilaterally trust one another, even within an organization. 
# 
# To disable host-based authentication, add or correct the following line in "/etc/ssh/sshd_config": 
# 
# HostbasedAuthentication no   
# 
# CCI: CCI-000766
# 
###################################################

#!/bin/bash

grep -i HostbasedAuthentication /etc/ssh/sshd_config