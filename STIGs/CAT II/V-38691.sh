###################################################
# 
# Group ID (Vulid):  V-38691
# Group Title:  SRG-OS-000034
# Rule ID:  SV-50492r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000331
# Rule Title: The Bluetooth service must be disabled.
# 
# Vulnerability Discussion:  Disabling the "bluetooth" service prevents the system from attempting connections to Bluetooth devices, which entails some security risk. Nevertheless, variation in this risk decision may be expected due to the utility of Bluetooth connectivity and its limited range.
# 
# Check Content:  
# To check that the "bluetooth" service is disabled in system boot configuration, run the following command: 
# 
# # chkconfig "bluetooth" --list
# 
# Output should indicate the "bluetooth" service has either not been installed, or has been disabled at all runlevels, as shown in the example below: 
# 
# # chkconfig "bluetooth" --list
# "bluetooth" 0:off 1:off 2:off 3:off 4:off 5:off 6:off
# 
# Run the following command to verify "bluetooth" is disabled through current runtime configuration: 
# 
# # service bluetooth status
# 
# If the service is disabled the command will return the following output: 
# 
# bluetooth is stopped
# 
# If the service is running, this is a finding.
# 
# Fix Text: The "bluetooth" service can be disabled with the following command: 
# 
# # chkconfig bluetooth off
# 
# # service bluetooth stop   
# 
# CCI: CCI-000085
# 
###################################################

#!/bin/bash

chkconfig "bluetooth" --list
service bluetooth status