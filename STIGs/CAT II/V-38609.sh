###################################################
# 
# Group ID (Vulid):  V-38609
# Group Title:  SRG-OS-000248
# Rule ID:  SV-50410r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000223
# Rule Title: The TFTP service must not be running.
# 
# Vulnerability Discussion:  Disabling the "tftp" service ensures the system is not acting as a tftp server, which does not provide encryption or authentication.
# 
# Check Content:  
# To check that the "tftp" service is disabled in system boot configuration, run the following command: 
# 
# # chkconfig "tftp" --list
# 
# Output should indicate the "tftp" service has either not been installed, or has been disabled at all runlevels, as shown in the example below: 
# 
# # chkconfig "tftp" --list
# "tftp" 0:off 1:off 2:off 3:off 4:off 5:off 6:off
# 
# Run the following command to verify "tftp" is disabled through current runtime configuration: 
# 
# # service tftp status
# 
# If the service is disabled the command will return the following output: 
# 
# tftp is stopped
# 
# If the service is running, this is a finding.
# 
# Fix Text: The "tftp" service should be disabled. The "tftp" service can be disabled with the following command: 
# 
# # chkconfig tftp off   
# 
# CCI: CCI-001436
# 
###################################################

#!/bin/bash

chkconfig "tftp" --list