# ###################################################
# 
# Group ID (Vulid):  V-38595
# Group Title:  SRG-OS-000105
# Rule ID:  SV-50396r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000349
# Rule Title: The system must be configured to require the use of a CAC, PIV compliant hardware token, or Alternate Logon Token (ALT) for authentication.
# 
# Vulnerability Discussion:  Smart card login provides two-factor authentication stronger than that provided by a username/password combination. Smart cards leverage a PKI (public key infrastructure) in order to provide and verify credentials.
# 
# Check Content:  
# Interview the SA to determine if all accounts not exempted by policy are using CAC authentication. For DoD systems, the following systems and accounts are exempt from using smart card (CAC) authentication: 
# 
# SIPRNET systems
# Standalone systems
# Application accounts
# Temporary employee accounts, such as students or interns, who cannot easily receive a CAC or PIV
# Operational tactical locations that are not collocated with RAPIDS workstations to issue CAC or ALT
# Test systems, such as those with an Interim Approval to Test (IATT) and use a separate VPN, firewall, or security measure preventing access to network and system components from outside the protection boundary documented in the IATT.
# 
# If non-exempt accounts are not using CAC authentication, this is a finding.
# 
# Fix Text: To enable smart card authentication, consult the documentation at: 
# 
# https://docs.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/6/html/Managing_Smart_Cards/enabling-smart-card-login.html   
# 
# CCI: CCI-000765
# 
###################################################

#!/bin/bash


