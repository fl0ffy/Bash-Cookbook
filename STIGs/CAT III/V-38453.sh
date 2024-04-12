###################################################
# 
# Group ID (Vulid):  V-38453
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50253r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000517
# Rule Title: The system package management tool must verify group-ownership on all files and directories associated with packages.
# 
# Vulnerability Discussion:  Group-ownership of system binaries and configuration files that is incorrect could allow an unauthorized user to gain privileges that they should not have. The group-ownership set by the vendor should be maintained. Any deviations from this baseline should be investigated.
# 
# Check Content:  
# The following command will list which files on the system have group-ownership different from what is expected by the RPM database: 
# 
# # rpm -Va | grep '^......G'
# 
# If there is output, this is a finding.
# 
# Fix Text: The RPM package management system can restore group-ownership of the package files and directories. The following command will update files and directories with group-ownership different from what is expected by the RPM database: 
# 
# # rpm -qf [file or directory name]
# # rpm --setugids [package]   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

rpm -Va | grep '^......G'