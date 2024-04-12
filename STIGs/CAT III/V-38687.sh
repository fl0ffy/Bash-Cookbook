###################################################
# 
# Group ID (Vulid):  V-38687
# Group Title:  SRG-OS-000160
# Rule ID:  SV-50488r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000321
# Rule Title: The system must provide VPN connectivity for communications over untrusted networks.
# 
# Vulnerability Discussion:  Providing the ability for remote users or systems to initiate a secure VPN connection protects information when it is transmitted over a wide area network.
# 
# Check Content:  
# Run the following command to determine if the "openswan" package is installed: 
# 
# # rpm -q openswan
# 
# If the package is not installed, this is a finding.
# 
# Fix Text: The Openswan package provides an implementation of IPsec and IKE, which permits the creation of secure tunnels over untrusted networks. The "openswan" package can be installed with the following command: 
# 
# # yum install openswan   
# 
# CCI: CCI-001130
# 
###################################################

#!/bin/bash

rpm -q openswan