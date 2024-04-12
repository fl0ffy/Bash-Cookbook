###################################################
# 
# Group ID (Vulid):  V-38456
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50256r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000002
# Rule Title: The system must use a separate file system for /var.
# 
# Vulnerability Discussion:  Ensuring that "/var" is mounted on its own partition enables the setting of more restrictive mount options. This helps protect system services such as daemons or other programs which use it. It is not uncommon for the "/var" directory to contain world-writable directories, installed by other software packages.
# 
# Check Content:  
# Run the following command to determine if "/var" is on its own partition or logical volume: 
# 
# $ mount | grep "on /var "
# 
# If "/var" has its own partition or volume group, a line will be returned. 
# If no line is returned, this is a finding.
# 
# Fix Text: The "/var" directory is used by daemons and other system services to store frequently-changing data. Ensure that "/var" has its own partition or logical volume at installation time, or migrate it using LVM.   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

mount | grep "on /var "