###################################################
# 
# Group ID (Vulid):  V-38606
# Group Title:  SRG-OS-000095
# Rule ID:  SV-50407r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000222
# Rule Title: The tftp-server package must not be installed.
# 
# Vulnerability Discussion:  Removing the "tftp-server" package decreases the risk of the accidental (or intentional) activation of tftp services.
# 
# Check Content:  
# Run the following command to determine if the "tftp-server" package is installed: 
# 
# # rpm -q tftp-server
# 
# If the package is installed, this is a finding.
# 
# Fix Text: The "tftp-server" package can be removed with the following command: 
# 
# # yum erase tftp-server   
# 
# CCI: CCI-000381
# 
###################################################

#!/bin/bash

rpm -q tftp-server