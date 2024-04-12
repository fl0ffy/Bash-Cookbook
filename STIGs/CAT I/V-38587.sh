# ###################################################
# 
# Group ID (Vulid):  V-38587
# Group Title:  SRG-OS-000095
# Rule ID:  SV-50388r1_rule
# Severity: CAT I
# Rule Version (STIG-ID):  RHEL-06-000206
# Rule Title: The telnet-server package must not be installed.
# 
# Vulnerability Discussion:  Removing the "telnet-server" package decreases the risk of the unencrypted telnet service's accidental (or intentional) activation.
# 
# Mitigation: If the telnet-server package is configured to only allow encrypted sessions, such as with Kerberos or the use of encrypted network tunnels, the risk of exposing sensitive information is mitigated.
# 
# Check Content:  
# Run the following command to determine if the "telnet-server" package is installed: 
# 
# # rpm -q telnet-server
# 
# If the package is installed, this is a finding.
# 
# Fix Text: The "telnet-server" package can be uninstalled with the following command: 
# 
# # yum erase telnet-server   
# 
# CCI: CCI-000381
# 
###################################################

#!/bin/bash

rpm -q telnet-server