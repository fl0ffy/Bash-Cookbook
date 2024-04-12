###################################################
# 
# Group ID (Vulid):  V-38675
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50476r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000308
# Rule Title: Process core dumps must be disabled unless needed.
# 
# Vulnerability Discussion:  A core dump includes a memory image taken at the time the operating system terminates an application. The memory image could contain sensitive data and is generally useful only for developers trying to debug problems.
# 
# Check Content:  
# To verify that core dumps are disabled for all users, run the following command: 
# 
# $ grep core /etc/security/limits.conf
# 
# The output should be: 
# 
# * hard core 0
# 
# If it is not, this is a finding.
# 
# Fix Text: To disable core dumps for all users, add the following line to "/etc/security/limits.conf": 
# 
# * hard core 0   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

grep core /etc/security/limits.conf