###################################################
# 
# Group ID (Vulid):  V-38628
# Group Title:  SRG-OS-000255
# Rule ID:  SV-50429r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000145
# Rule Title: The operating system must produce audit records containing sufficient information to establish the identity of any user/subject associated with the event.
# 
# Vulnerability Discussion:  Ensuring the "auditd" service is active ensures audit records generated by the kernel can be written to disk, or that appropriate actions will be taken if other obstacles exist.
# 
# Check Content:  
# Run the following command to determine the current status of the "auditd" service: 
# 
# # service auditd status
# 
# If the service is enabled, it should return the following: 
# 
# auditd is running...
# 
# If the service is not running, this is a finding.
# 
# Fix Text: The "auditd" service is an essential userspace component of the Linux Auditing System, as it is responsible for writing audit records to disk. The "auditd" service can be enabled with the following command: 
# 
# # chkconfig auditd on   
# 
# CCI: CCI-001487
# 
###################################################

#!/bin/bash

service auditd status
