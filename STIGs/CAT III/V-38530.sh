###################################################
# 
# Group ID (Vulid):  V-38530
# Group Title:  SRG-OS-000062
# Rule ID:  SV-50331r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000173
# Rule Title: The audit system must be configured to audit all attempts to alter system time through /etc/localtime.
# 
# Vulnerability Discussion:  Arbitrary changes to the system time can be used to obfuscate nefarious activities in log files, as well as to confuse network services that are highly dependent upon an accurate system time (such as sshd). All changes to the system time should be audited.
# 
# Check Content:  
# To determine if the system is configured to audit attempts to alter time via the /etc/localtime file, run the following command: 
# 
# # auditctl -l | grep "watch=/etc/localtime"
# 
# If the system is configured to audit this activity, it will return a line. 
# If the system is not configured to audit time changes, this is a finding.
# 
# Fix Text: Add the following to "/etc/audit/audit.rules": 
# 
# -w /etc/localtime -p wa -k audit_time_rules
# 
# The -k option allows for the specification of a key in string form that can be used for better reporting capability through ausearch and aureport and should always be used.   
# 
# CCI: CCI-000169
# 
###################################################

#!/bin/bash

auditctl -l | grep "watch=/etc/localtime"

echo '-w /etc/localtime -p wa -k audit_time_rules' >> /etc/audit/audit.rules