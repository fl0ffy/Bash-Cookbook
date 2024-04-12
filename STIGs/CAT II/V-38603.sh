###################################################
# 
# Group ID (Vulid):  V-38603
# Group Title:  SRG-OS-000095
# Rule ID:  SV-50404r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000220
# Rule Title: The ypserv package must not be installed.
# 
# Vulnerability Discussion:  Removing the "ypserv" package decreases the risk of the accidental (or intentional) activation of NIS or NIS+ services.
# 
# Check Content:  
# Run the following command to determine if the "ypserv" package is installed: 
# 
# # rpm -q ypserv
# 
# If the package is installed, this is a finding.
# 
# Fix Text: The "ypserv" package can be uninstalled with the following command: 
# 
# # yum erase ypserv   
# 
# CCI: CCI-000381
# 
###################################################

#!/bin/bash

rpm -q ypserv
