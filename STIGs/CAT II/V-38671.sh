###################################################
# 
# Group ID (Vulid):  V-38671
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50472r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000288
# Rule Title: The sendmail package must be removed.
# 
# Vulnerability Discussion:  The sendmail software was not developed with security in mind and its design prevents it from being effectively contained by SELinux. Postfix should be used instead.
# 
# Check Content:  
# Run the following command to determine if the "sendmail" package is installed: 
# 
# # rpm -q sendmail
# 
# If the package is installed, this is a finding.
# 
# Fix Text: Sendmail is not the default mail transfer agent and is not installed by default. The "sendmail" package can be removed with the following command: 
# 
# # yum erase sendmail   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

rpm -q sendmail