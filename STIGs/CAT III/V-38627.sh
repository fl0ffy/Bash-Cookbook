###################################################
# 
# Group ID (Vulid):  V-38627
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50428r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000256
# Rule Title: The openldap-servers package must not be installed unless required.
# 
# Vulnerability Discussion:  Unnecessary packages should not be installed to decrease the attack surface of the system.
# 
# Check Content:  
# To verify the "openldap-servers" package is not installed, run the following command: 
# 
# $ rpm -q openldap-servers
# 
# The output should show the following. 
# 
# package openldap-servers is not installed
# 
# If it does not, this is a finding.
# 
# Fix Text: The "openldap-servers" package should be removed if not in use. Is this machine the OpenLDAP server? If not, remove the package. 
# 
# # yum erase openldap-servers
# 
# The openldap-servers RPM is not installed by default on RHEL6 machines. It is needed only by the OpenLDAP server, not by the clients which use LDAP for authentication. If the system is not intended for use as an LDAP Server it should be removed.   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

rpm -q openldap-servers
