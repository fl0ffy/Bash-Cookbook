###################################################
# 
# Group ID (Vulid):  V-38452
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50252r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000518
# Rule Title: The system package management tool must verify permissions on all files and directories associated with packages.
# 
# Vulnerability Discussion:  Permissions on system binaries and configuration files that are too generous could allow an unauthorized user to gain privileges that they should not have. The permissions set by the vendor should be maintained. Any deviations from this baseline should be investigated.
# 
# Check Content:  
# The following command will list which files and directories on the system have permissions different from what is expected by the RPM database: 
# 
# # rpm -Va | grep '^.M'
# 
# If there is any output, for each file or directory found, find the associated RPM package and compare the RPM-expected permissions with the actual permissions on the file or directory:
# 
# # rpm -qf [file or directory name]
# # rpm -q --queryformat "[%{FILENAMES} %{FILEMODES:perms}\n]" [package] | grep [filename]
# # ls -lL [filename]
# 
# If the existing permissions are more permissive than those expected by RPM, this is a finding.
# 
# Fix Text: The RPM package management system can restore file access permissions of package files and directories. The following command will update permissions on files and directories with permissions different from what is expected by the RPM database: 
# 
# # rpm --setperms [package]   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

rpm -Va | grep '^.M'

