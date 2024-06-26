# ###################################################
# 
# Group ID (Vulid):  V-38589
# Group Title:  SRG-OS-000129
# Rule ID:  SV-50390r1_rule
# Severity: CAT I
# Rule Version (STIG-ID):  RHEL-06-000211
# Rule Title: The telnet daemon must not be running.
# 
# Vulnerability Discussion:  The telnet protocol uses unencrypted network communication, which means that data from the login session, including passwords and all other information transmitted during the session, can be stolen by eavesdroppers on the network. The telnet protocol is also subject to man-in-the-middle attacks.
# 
# Mitigation: If an enabled telnet daemon is configured to only allow encrypted sessions, such as with Kerberos or the use of encrypted network tunnels, the risk of exposing sensitive information is mitigated.
# 
# Check Content:  
# To check that the "telnet" service is disabled in system boot configuration, run the following command: 
# 
# # chkconfig "telnet" --list
# 
# Output should indicate the "telnet" service has either not been installed, or has been disabled at all runlevels, as shown in the example below: 
# 
# # chkconfig "telnet" --list
# "telnet" 0:off 1:off 2:off 3:off 4:off 5:off 6:off
# 
# Run the following command to verify "telnet" is disabled through current runtime configuration: 
# 
# # service telnet status
# 
# If the service is disabled the command will return the following output: 
# 
# telnet is stopped
# 
# If the service is running, this is a finding.
# 
# Fix Text: The "telnet" service can be disabled with the following command: 
# 
# # chkconfig telnet off   
# 
# CCI: CCI-000888
# 
###################################################

#!/bin/bash

chkconfig "telnet" --list

#chkconfig --list | grep telnet

service telnet status
