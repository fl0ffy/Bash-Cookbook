# ###################################################
# 
# Group ID (Vulid):  V-38598
# Group Title:  SRG-OS-000033
# Rule ID:  SV-50399r1_rule
# Severity: CAT I
# Rule Version (STIG-ID):  RHEL-06-000216
# Rule Title: The rexecd service must not be running.
# 
# Vulnerability Discussion:  The rexec service uses unencrypted network communications, which means that data from the login session, including passwords and all other information transmitted during the session, can be stolen by eavesdroppers on the network.
# 
# Check Content:  
# To check that the "rexec" service is disabled in system boot configuration, run the following command: 
# 
# # chkconfig "rexec" --list
# 
# Output should indicate the "rexec" service has either not been installed, or has been disabled at all runlevels, as shown in the example below: 
# 
# # chkconfig "rexec" --list
# "rexec" 0:off 1:off 2:off 3:off 4:off 5:off 6:off
# 
# Run the following command to verify "rexec" is disabled through current runtime configuration: 
# 
# # service rexec status
# 
# If the service is disabled the command will return the following output: 
# 
# rexec is stopped
# 
# If the service is running, this is a finding.
# 
# Fix Text: The "rexec" service, which is available with the "rsh-server" package and runs as a service through xinetd, should be disabled. The "rexec" service can be disabled with the following command: 
# 
# # chkconfig rexec off   
# 
# CCI: CCI-000068
# 
###################################################

#!/bin/bash

chkconfig "rexec" --list
#chkconfig --list | grep rexec

service rexec status