###################################################
# 
# Group ID (Vulid):  V-38485
# Group Title:  SRG-OS-000025
# Rule ID:  SV-50286r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000506
# Rule Title: The operating system, upon successful logon, must display to the user the date and time of the last logon or access via a local console or tty.
# 
# Vulnerability Discussion:  Users need to be aware of activity that occurs regarding their accounts. Providing users with information regarding the date and time of their last successful login allows the user to determine if any unauthorized activity has occurred and gives them an opportunity to notify administrators.
# 
# At console or tty logon, a user must be presented with the last successful login date and time. The "hushlogin" file determines whether this occurs.
# 
# Check Content:  
# Verify there are no "hushlogin" files active on the system:
# 
# # ls -l /etc/hushlogins
# 
# For each home directory stored in "/etc/passwd":
# 
# # ls ~<userid>/.hushlogin
# 
# If there are any "hushlogin" files on the system, this is a finding.
# 
# Fix Text: Remove any "hushlogin" files from the system:
# 
# # rm /etc/hushlogins
# # rm ~<userid>/.hushlogin  
# 
#  
###################################################

#!/bin/bash

ls -l /etc/hushlogins