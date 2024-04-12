###################################################
# 
# Group ID (Vulid):  V-38463
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50263r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000003
# Rule Title: The system must use a separate file system for /var/log.
# 
# Vulnerability Discussion:  Placing "/var/log" in its own partition enables better separation between log files and other files in "/var/".
# 
# Check Content:  
# Run the following command to determine if "/var/log" is on its own partition or logical volume: 
# 
# $ mount | grep "on /var/log "
# 
# If "/var/log" has its own partition or volume group, a line will be returned. 
# If no line is returned, this is a finding.
# 
# Fix Text: System logs are stored in the "/var/log" directory. Ensure that it has its own partition or logical volume at installation time, or migrate it using LVM.   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

mount | grep "on /var/log "