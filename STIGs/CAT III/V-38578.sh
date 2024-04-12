###################################################
# 
# Group ID (Vulid):  V-38578
# Group Title:  SRG-OS-000064
# Rule ID:  SV-50379r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000201
# Rule Title: The audit system must be configured to audit changes to the /etc/sudoers file.
# 
# Vulnerability Discussion:  The actions taken by system administrators should be audited to keep a record of what was executed on the system, as well as, for accountability purposes.
# 
# Check Content:  
# To verify that auditing is configured for system administrator actions, run the following command: 
# 
# # auditctl -l | grep "watch=/etc/sudoers"
# 
# If there is no output, this is a finding.
# 
# Fix Text: At a minimum, the audit system should collect administrator actions for all users and root. Add the following to "/etc/audit/audit.rules": 
# 
# -w /etc/sudoers -p wa -k actions   
# 
# CCI: CCI-000172
# 
###################################################

#!/bin/bash

auditctl -l | grep "watch=/etc/sudoers"

echo "" >> /etc/audit/audit.rules
echo '#actions' >> /etc/audit/audit.rules
echo '-w /etc/sudoers -p wa -k actions' >> /etc/audit/audit.rules