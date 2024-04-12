###################################################
# 
# Group ID (Vulid):  V-38625
# Group Title:  SRG-OS-000250
# Rule ID:  SV-50426r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000252
# Rule Title: If the system is using LDAP for authentication or account information, the system must use a TLS connection using FIPS 140-2 approved cryptographic algorithms.
# 
# Vulnerability Discussion:  The ssl directive specifies whether to use ssl or not. If not specified it will default to "no". It should be set to "start_tls" rather than doing LDAP over SSL.
# 
# Check Content:  
# If the system does not use LDAP for authentication or account information, this is not applicable.
# 
# To ensure LDAP is configured to use TLS for all transactions, run the following command: 
# 
# $ grep start_tls /etc/pam_ldap.conf
# 
# If no lines are returned, this is a finding.
# 
# Fix Text: Configure LDAP to enforce TLS use. First, edit the file "/etc/pam_ldap.conf", and add or correct the following lines: 
# 
# ssl start_tls
# 
# Then review the LDAP server and ensure TLS has been configured.   
# 
# CCI: CCI-001453
# 
###################################################

#!/bin/bash

grep start_tls /etc/pam_ldap.conf