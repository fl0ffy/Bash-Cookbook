# ###################################################
# 
# Group ID (Vulid):  V-38541
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50342r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000183
# Rule Title: The audit system must be configured to audit modifications to the systems Mandatory Access Control (MAC) configuration (SELinux).
# 
# Vulnerability Discussion:  The system's mandatory access policy (SELinux) should not be arbitrarily changed by anything other than administrator action. All changes to MAC policy should be audited.
# 
# Check Content:  
# To determine if the system is configured to audit changes to its SELinux configuration files, run the following command: 
# 
# # auditctl -l | grep "dir=/etc/selinux"
# 
# If the system is configured to watch for changes to its SELinux configuration, a line should be returned (including "perm=wa" indicating permissions that are watched). 
# If the system is not configured to audit attempts to change the MAC policy, this is a finding.
# 
# Fix Text: Add the following to "/etc/audit/audit.rules": 
# 
# -w /etc/selinux/ -p wa -k MAC-policy   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

auditctl -l | grep "dir=/etc/selinux"

echo "" >> /etc/audit/audit.rules
echo '# MAC-policy' >> /etc/audit/audit.rules
echo '-w /etc/selinux/ -p wa -k MAC-policy' >> /etc/audit/audit.rules