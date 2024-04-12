# ###################################################
# 
# Group ID (Vulid):  V-38591
# Group Title:  SRG-OS-000095
# Rule ID:  SV-50392r1_rule
# Severity: CAT I
# Rule Version (STIG-ID):  RHEL-06-000213
# Rule Title: The rsh-server package must not be installed.
# 
# Vulnerability Discussion:  The "rsh-server" package provides several obsolete and insecure network services. Removing it decreases the risk of those services' accidental (or intentional) activation.
# 
# Check Content:  
# Run the following command to determine if the "rsh-server" package is installed: 
# 
# # rpm -q rsh-server
# 
# If the package is installed, this is a finding.
# 
# Fix Text: The "rsh-server" package can be uninstalled with the following command: 
# 
# # yum erase rsh-server   
# 
# CCI: CCI-000381
# 
###################################################

#!/bin/bash

rpm -q rsh-server