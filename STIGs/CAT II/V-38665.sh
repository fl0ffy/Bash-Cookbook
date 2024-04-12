###################################################
# 
# Group ID (Vulid):  V-38665
# Group Title:  SRG-OS-000258
# Rule ID:  SV-50466r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000280
# Rule Title: The system package management tool must verify group-ownership on all files and directories associated with the audit package.
# 
# Vulnerability Discussion:  Group-ownership of audit binaries and configuration files that is incorrect could allow an unauthorized user to gain privileges that they should not have. The group-ownership set by the vendor should be maintained. Any deviations from this baseline should be investigated.
# 
# Check Content:  
# The following command will list which audit files on the system have group-ownership different from what is expected by the RPM database: 
# 
# # rpm -V audit | grep '^......G'
# 
# If there is output, this is a finding.
# 
# Fix Text: The RPM package management system can restore file group-ownership of the audit package files and directories. The following command will update audit files with group-ownership different from what is expected by the RPM database: 
# 
# # rpm --setugids audit   
# 
# CCI: CCI-001495
# 
###################################################

#!/bin/bash

 rpm -V audit | grep '^......G'
