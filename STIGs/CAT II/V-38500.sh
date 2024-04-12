###################################################
# 
# Group ID (Vulid):  V-38500
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50301r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000032
# Rule Title: The root account must be the only account having a UID of 0.
# 
# Vulnerability Discussion:  An account has root authority if it has a UID of 0. Multiple accounts with a UID of 0 afford more opportunity for potential intruders to guess a password for a privileged account. Proper configuration of sudo is recommended to afford multiple system administrators access to root privileges in an accountable manner.
# 
# Check Content:  
# To list all password file entries for accounts with UID 0, run the following command: 
# 
# # awk -F: '($3 == "0") {print}' /etc/passwd
# 
# This should print only one line, for the user root. 
# If any account other than root has a UID of 0, this is a finding.
# 
# Fix Text: If any account other than root has a UID of 0, this misconfiguration should be investigated and the accounts other than root should be removed or have their UID changed.   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

awk -F: '($3 == "0") {print}' /etc/passwd