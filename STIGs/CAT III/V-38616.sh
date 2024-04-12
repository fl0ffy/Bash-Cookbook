###################################################
# 
# Group ID (Vulid):  V-38616
# Group Title:  SRG-OS-000242
# Rule ID:  SV-50417r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000241
# Rule Title: The SSH daemon must not permit user environment settings.
# 
# Vulnerability Discussion:  SSH environment options potentially allow users to bypass access restriction in some configurations.
# 
# Check Content:  
# To ensure users are not able to present environment daemons, run the following command: 
# 
# # grep PermitUserEnvironment /etc/ssh/sshd_config
# 
# If properly configured, output should be: 
# 
# PermitUserEnvironment no
# 
# If it is not, this is a finding.
# 
# Fix Text: To ensure users are not able to present environment options to the SSH daemon, add or correct the following line in "/etc/ssh/sshd_config": 
# 
# PermitUserEnvironment no   
# 
# CCI: CCI-001414
# 
###################################################

#!/bin/bash

grep PermitUserEnvironment /etc/ssh/sshd_config