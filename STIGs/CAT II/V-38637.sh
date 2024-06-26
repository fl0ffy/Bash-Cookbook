###################################################
# 
# Group ID (Vulid):  V-38637
# Group Title:  SRG-OS-000278
# Rule ID:  SV-50438r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000281
# Rule Title: The system package management tool must verify contents of all files associated with the audit package.
# 
# Vulnerability Discussion:  The hash on important files like audit system executables should match the information given by the RPM database. Audit executables with erroneous hashes could be a sign of nefarious activity on the system.
# 
# Check Content:  
# The following command will list which audit files on the system have file hashes different from what is expected by the RPM database. 
# 
# # rpm -V audit | grep '$1 ~ /..5/ && $2 != "c"'
# 
# If there is output, this is a finding.
# 
# Fix Text: The RPM package management system can check the hashes of audit system package files. Run the following command to list which audit files on the system have hashes that differ from what is expected by the RPM database: 
# 
# # rpm -V audit | grep '^..5'
# 
# A "c" in the second column indicates that a file is a configuration file, which may appropriately be expected to change. If the file that has changed was not expected to then refresh from distribution media or online repositories. 
# 
# rpm -Uvh [affected_package]
# 
# OR 
# 
# yum reinstall [affected_package]   
# 
# CCI: CCI-001496
# 
###################################################

#!/bin/bash

rpm -V audit | grep '$1 ~ /..5/ && $2 != "c"'
