###################################################
# 
# Group ID (Vulid):  V-38489
# Group Title:  SRG-OS-000232
# Rule ID:  SV-50290r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000016
# Rule Title: A file integrity tool must be installed.
# 
# Vulnerability Discussion:  The AIDE package must be installed if it is to be available for integrity checking.
# 
# Check Content:  
# If another file integrity tool is installed, this is not a finding.
# 
# Run the following command to determine if the "aide" package is installed: 
# 
# # rpm -q aide
# 
# If the package is not installed, this is a finding.
# 
# Fix Text: Install the AIDE package with the command: 
# 
# # yum install aide   
# 
# CCI: CCI-001069
# 
###################################################

#!/bin/bash

rpm -q aide