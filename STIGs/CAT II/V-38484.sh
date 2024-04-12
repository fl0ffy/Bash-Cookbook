###################################################
# 
# Group ID (Vulid):  V-38484
# Group Title:  SRG-OS-000025
# Rule ID:  SV-50285r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000507
# Rule Title: The operating system, upon successful logon, must display to the user the date and time of the last logon or access via ssh.
# 
# Vulnerability Discussion:  Users need to be aware of activity that occurs regarding their account. Providing users with information regarding the date and time of their last successful login allows the user to determine if any unauthorized activity has occurred and gives them an opportunity to notify administrators.
# 
# At ssh login, a user must be presented with the last successful login date and time.
# 
# Check Content:  
# Verify the value associated with the "PrintLastLog" keyword in /etc/ssh/sshd_config:
# 
# # grep -i PrintLastLog /etc/ssh/sshd_config
# 
# If the value is not set to "yes", this is a finding. If the "PrintLastLog" keyword is not present, this is not a finding.
# 
# Fix Text: Update the "PrintLastLog" keyword to "yes" in /etc/ssh/sshd_config:
# 
# PrintLastLog yes
# 
# While it is acceptable to remove the keyword entirely since the default action for the SSH daemon is to print the last login date and time, it is preferred to have the value explicitly documented.   
# 
# CCI: CCI-000052
# 
###################################################

#!/bin/bash

grep -i PrintLastLog /etc/ssh/sshd_config