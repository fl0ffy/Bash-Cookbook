###################################################
# 
# Group ID (Vulid):  V-38664
# Group Title:  SRG-OS-000257
# Rule ID:  SV-50465r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000279
# Rule Title: The system package management tool must verify ownership on all files and directories associated with the audit package.
# 
# Vulnerability Discussion:  Ownership of audit binaries and configuration files that is incorrect could allow an unauthorized user to gain privileges that they should not have. The ownership set by the vendor should be maintained. Any deviations from this baseline should be investigated.
# 
# Check Content:  
# The following command will list which audit files on the system have ownership different from what is expected by the RPM database: 
# 
# # rpm -V audit | grep '^.....U'
# 
# If there is output, this is a finding.
# 
# Fix Text: The RPM package management system can restore file ownership of the audit package files and directories. The following command will update audit files with ownership different from what is expected by the RPM database: 
# 
# # rpm --setugids audit   
# 
# CCI: CCI-001494
# 
###################################################

#!/bin/bash

rpm -V audit | grep '^.....U'