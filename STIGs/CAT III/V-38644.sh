###################################################
# 
# Group ID (Vulid):  V-38644
# Group Title:  SRG-OS-000096
# Rule ID:  SV-50445r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000265
# Rule Title: The ntpdate service must not be running.
# 
# Vulnerability Discussion:  The "ntpdate" service may only be suitable for systems which are rebooted frequently enough that clock drift does not cause problems between reboots. In any event, the functionality of the ntpdate service is now available in the ntpd program and should be considered deprecated.
# 
# Check Content:  
# To check that the "ntpdate" service is disabled in system boot configuration, run the following command: 
# 
# # chkconfig "ntpdate" --list
# 
# Output should indicate the "ntpdate" service has either not been installed, or has been disabled at all runlevels, as shown in the example below: 
# 
# # chkconfig "ntpdate" --list
# "ntpdate" 0:off 1:off 2:off 3:off 4:off 5:off 6:off
# 
# Run the following command to verify "ntpdate" is disabled through current runtime configuration: 
# 
# # service ntpdate status
# 
# If the service is disabled the command will return the following output: 
# 
# ntpdate is stopped
# 
# If the service is running, this is a finding.
# 
# Fix Text: The ntpdate service sets the local hardware clock by polling NTP servers when the system boots. It synchronizes to the NTP servers listed in "/etc/ntp/step-tickers" or "/etc/ntp.conf" and then sets the local hardware clock to the newly synchronized system time. The "ntpdate" service can be disabled with the following command: 
# 
# # chkconfig ntpdate off   
# 
# CCI: CCI-000382
# 
###################################################

#!/bin/bash

chkconfig "ntpdate" --list