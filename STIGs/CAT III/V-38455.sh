###################################################
# Group ID (Vulid):  V-38455
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50255r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000001
# Rule Title: The system must use a separate file system for /tmp.
# 
# Vulnerability Discussion:  The "/tmp" partition is used as temporary storage by many programs. Placing "/tmp" in its own partition enables the setting of more restrictive mount options, which can help protect programs which use it.
# 
# Check Content:  
# Run the following command to determine if "/tmp" is on its own partition or logical volume: 
# 
# $ mount | grep "on /tmp "
# 
# If "/tmp" has its own partition or volume group, a line will be returned. 
# If no line is returned, this is a finding.
# 
# Fix Text: The "/tmp" directory is a world-writable directory used for temporary file storage. Ensure it has its own partition or logical volume at installation time, or migrate it using LVM.   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

mount | grep "on /tmp "

