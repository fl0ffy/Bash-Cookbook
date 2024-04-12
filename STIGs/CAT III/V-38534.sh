###################################################
# 
# Group ID (Vulid):  V-38534
# Group Title:  SRG-OS-000239
# Rule ID:  SV-50335r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000175
# Rule Title: The operating system must automatically audit account modification.
# 
# Vulnerability Discussion:  In addition to auditing new user and group accounts, these watches will alert the system administrator(s) to any modifications. Any unexpected users, groups, or modifications should be investigated for legitimacy.
# 
# Check Content:  
# To determine if the system is configured to audit account changes, run the following command: 
# 
# auditctl -l | egrep '(/etc/passwd|/etc/shadow|/etc/group|/etc/gshadow|/etc/security/opasswd)'
# 
# If the system is configured to watch for account changes, lines should be returned for each file specified (and with "perm=wa" for each). 
# If the system is not configured to audit account changes, this is a finding.
# 
# Fix Text: Add the following to "/etc/audit/audit.rules", in order to capture events that modify account changes: 
# 
# # audit_account_changes
# -w /etc/group -p wa -k audit_account_changes
# -w /etc/passwd -p wa -k audit_account_changes
# -w /etc/gshadow -p wa -k audit_account_changes
# -w /etc/shadow -p wa -k audit_account_changes
# -w /etc/security/opasswd -p wa -k audit_account_changes   
# 
# CCI: CCI-001403
# 
###################################################

#!/bin/bash


