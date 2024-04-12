###################################################
# 
# Group ID (Vulid):  V-38618
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50419r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000246
# Rule Title: The avahi service must be disabled.
# 
# Vulnerability Discussion:  Because the Avahi daemon service keeps an open network port, it is subject to network attacks. Its functionality is convenient but is only appropriate if the local network can be trusted.
# 
# Check Content:  
# To check that the "avahi-daemon" service is disabled in system boot configuration, run the following command: 
# 
# # chkconfig "avahi-daemon" --list
# 
# Output should indicate the "avahi-daemon" service has either not been installed, or has been disabled at all runlevels, as shown in the example below: 
# 
# # chkconfig "avahi-daemon" --list
# "avahi-daemon" 0:off 1:off 2:off 3:off 4:off 5:off 6:off
# 
# Run the following command to verify "avahi-daemon" is disabled through current runtime configuration: 
# 
# # service avahi-daemon status
# 
# If the service is disabled the command will return the following output: 
# 
# avahi-daemon is stopped
# 
# If the service is running, this is a finding.
# 
# Fix Text: The "avahi-daemon" service can be disabled with the following command: 
# 
# # chkconfig avahi-daemon off   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

chkconfig "avahi-daemon" --list