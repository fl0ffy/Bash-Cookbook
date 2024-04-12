###################################################
# 
# Group ID (Vulid):  V-38611
# Group Title:  SRG-OS-000106
# Rule ID:  SV-50412r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000234
# Rule Title: The SSH daemon must ignore .rhosts files.
# 
# Vulnerability Discussion:  SSH trust relationships mean a compromise on one host can allow an attacker to move trivially to other hosts.
# 
# Check Content:  
# To determine how the SSH daemon's "IgnoreRhosts" option is set, run the following command: 
# 
# # grep -i IgnoreRhosts /etc/ssh/sshd_config
# 
# If no line, a commented line, or a line indicating the value "yes" is returned, then the required value is set. 
# If the required value is not set, this is a finding.
# 
# Fix Text: SSH can emulate the behavior of the obsolete rsh command in allowing users to enable insecure access to their accounts via ".rhosts" files. 
# 
# To ensure this behavior is disabled, add or correct the following line in "/etc/ssh/sshd_config": 
# 
# IgnoreRhosts yes   
# 
# CCI: CCI-000766
# 
###################################################

#!/bin/bash

grep -i IgnoreRhosts /etc/ssh/sshd_config