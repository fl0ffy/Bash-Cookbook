###################################################
# 
# Group ID (Vulid):  V-38481
# Group Title:  SRG-OS-000191
# Rule ID:  SV-50281r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000011
# Rule Title: System security patches and updates must be installed and up-to-date.
# 
# Vulnerability Discussion:  Installing software updates is a fundamental mitigation against the exploitation of publicly-known vulnerabilities.
# 
# Check Content:  
# If the system is joined to the Red Hat Network, a Red Hat Satellite Server, or a yum server which provides updates, invoking the following command will indicate if updates are available: 
# 
# # yum check-update
# 
# If the system is not configured to update from one of these sources, run the following command to list when each package was last updated: 
# 
# $ rpm -qa -last
# 
# Compare this to Red Hat Security Advisories (RHSA) listed at https://access.redhat.com/security/updates/active/ to determine whether the system is missing applicable security and bugfix updates. 
# If updates are not installed, this is a finding.
# 
# Fix Text: If the system is joined to the Red Hat Network, a Red Hat Satellite Server, or a yum server, run the following command to install updates: 
# 
# # yum update
# 
# If the system is not configured to use one of these sources, updates (in the form of RPM packages) can be manually downloaded from the Red Hat Network and installed using "rpm".   
# 
# CCI: CCI-001233
# 
###################################################

#!/bin/bash

yum check-update