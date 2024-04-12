###################################################
# 
# Group ID (Vulid):  V-38663
# Group Title:  SRG-OS-000256
# Rule ID:  SV-50464r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000278
# Rule Title: The system package management tool must verify permissions on all files and directories associated with the audit package.
# 
# Vulnerability Discussion:  Permissions on audit binaries and configuration files that are too generous could allow an unauthorized user to gain privileges that they should not have. The permissions set by the vendor should be maintained. Any deviations from this baseline should be investigated.
# 
# Check Content:  
# The following command will list which audit files on the system have permissions different from what is expected by the RPM database: 
# 
# # rpm -V audit | grep '^.M'
# 
# If there is any output, for each file or directory found, compare the RPM-expected permissions with the permissions on the file or directory:
# 
# # rpm -q --queryformat "[%{FILENAMES} %{FILEMODES:perms}\n]" audit | grep [filename]
# # ls -lL [filename]
# 
# If the existing permissions are more permissive than those expected by RPM, this is a finding.
# 
# Fix Text: The RPM package management system can restore file access permissions of the audit package files and directories. The following command will update audit files with permissions different from what is expected by the RPM database: 
# 
# # rpm --setperms audit   
# 
# CCI: CCI-001493
# 
###################################################

#!/bin/bash


rpm -V audit | grep '^.M'