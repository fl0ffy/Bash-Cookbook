###################################################
# 
# Group ID (Vulid):  V-38676
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50477r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000291
# Rule Title: The xorg-x11-server-common (X Windows) package must not be installed, unless required.
# 
# Vulnerability Discussion:  Unnecessary packages should not be installed to decrease the attack surface of the system.
# 
# Check Content:  
# To ensure the X Windows package group is removed, run the following command: 
# 
# $ rpm -qi xorg-x11-server-common
# 
# The output should be: 
# 
# package xorg-x11-server-common is not installed
# 
# If it is not, this is a finding.
# 
# Fix Text: Removing all packages which constitute the X Window System ensures users or malicious software cannot start X. To do so, run the following command: 
# 
# # yum groupremove "X Window System"
# 
#  
###################################################

#!/bin/bash

rpm -qi xorg-x11-server-common