###################################################
# 
# Group ID (Vulid):  V-38654
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50455r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000270
# Rule Title: Remote file systems must be mounted with the nosuid option.
# 
# Vulnerability Discussion:  NFS mounts should not present suid binaries to users. Only vendor-supplied suid executables should be installed to their default location on the local filesystem.
# 
# Check Content:  
# To verify the "nosuid" option is configured for all NFS mounts, run the following command: 
# 
# $ mount | grep nfs
# 
# All NFS mounts should show the "nosuid" setting in parentheses. 
# If the setting does not show, this is a finding.
# 
# Fix Text: Add the "nosuid" option to the fourth column of "/etc/fstab" for the line which controls mounting of any NFS mounts.   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

mount | grep nfs