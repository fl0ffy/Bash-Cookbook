###################################################
# 
# Group ID (Vulid):  V-38652
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50453r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000269
# Rule Title: Remote file systems must be mounted with the nodev option.
# 
# Vulnerability Discussion:  Legitimate device files should only exist in the /dev directory. NFS mounts should not present device files to users.
# 
# Check Content:  
# To verify the "nodev" option is configured for all NFS mounts, run the following command: 
# 
# $ mount | grep nfs
# 
# All NFS mounts should show the "nodev" setting in parentheses. 
# If the setting does not show, this is a finding.
# 
# Fix Text: Add the "nodev" option to the fourth column of "/etc/fstab" for the line which controls mounting of any NFS mounts.   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash


mount | grep nfs