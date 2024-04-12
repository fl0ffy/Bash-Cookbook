###################################################
# 
# Group ID (Vulid):  V-38568
# Group Title:  SRG-OS-000064
# Rule ID:  SV-50369r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000199
# Rule Title: The audit system must be configured to audit successful file system mounts.
# 
# Vulnerability Discussion:  The unauthorized exportation of data to external media could result in an information leak where classified information, Privacy Act information, and intellectual property could be lost. An audit trail should be created each time a filesystem is mounted to help identify and guard against information loss.
# 
# Check Content:  
# To verify that auditing is configured for all media exportation events, run the following command: 
# 
# # auditctl -l | grep syscall | grep mount
# 
# If there is no output, this is a finding.
# 
# Fix Text: At a minimum, the audit system should collect media exportation events for all users and root. Add the following to "/etc/audit/audit.rules", setting ARCH to either b32 or b64 as appropriate for your system: 
# 
# -a always,exit -F arch=ARCH -S mount -F auid>=500 -F auid!=4294967295 -k export
# -a always,exit -F arch=ARCH -S mount -F auid==0 -k export   
# 
# CCI: CCI-000172
# 
###################################################

#!/bin/bash

auditctl -l | grep syscall | grep mount

echo "" >> /etc/audit/audit.rules
echo '#export' >> /etc/audit/audit.rules
echo '-a always,exit -F arch=ARCH -S mount -F auid>=500 -F auid!=4294967295 -k export' >> /etc/audit/audit.rules
echo '-a always,exit -F arch=ARCH -S mount -F auid==0 -k export' >> /etc/audit/audit.rules