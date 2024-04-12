###################################################
# 
# Group ID (Vulid):  V-38610
# Group Title:  SRG-OS-000126
# Rule ID:  SV-50411r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000231
# Rule Title: The SSH daemon must set a timeout count on idle sessions.
# 
# Vulnerability Discussion:  This ensures a user login will be terminated as soon as the "ClientAliveCountMax" is reached.
# 
# Check Content:  
# To ensure the SSH idle timeout will occur when the "ClientAliveCountMax" is set, run the following command: 
# 
# # grep ClientAliveCountMax /etc/ssh/sshd_config
# 
# If properly configured, output should be: 
# 
# ClientAliveCountMax 0
# 
# If it is not, this is a finding.
# 
# Fix Text: To ensure the SSH idle timeout occurs precisely when the "ClientAliveCountMax" is set, edit "/etc/ssh/sshd_config" as follows: 
# 
# ClientAliveCountMax 0   
# 
# CCI: CCI-000879
# 
###################################################

#!/bin/bash

grep ClientAliveCountMax /etc/ssh/sshd_config