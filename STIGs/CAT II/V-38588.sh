###################################################
# 
# Group ID (Vulid):  V-38588
# Group Title:  SRG-OS-000080
# Rule ID:  SV-50389r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000070
# Rule Title: The system must not permit interactive boot.
# 
# Vulnerability Discussion:  Using interactive boot, the console user could disable auditing, firewalls, or other services, weakening system security.
# 
# Check Content:  
# To check whether interactive boot is disabled, run the following command: 
# 
# $ grep PROMPT /etc/sysconfig/init
# 
# If interactive boot is disabled, the output will show: 
# 
# PROMPT=no
# 
# If it does not, this is a finding.
# 
# Fix Text: To disable the ability for users to perform interactive startups, edit the file "/etc/sysconfig/init". Add or correct the line: 
# 
# PROMPT=no
# 
# The "PROMPT" option allows the console user to perform an interactive system startup, in which it is possible to select the set of services which are started on boot.   
# 
# CCI: CCI-000213
# 
###################################################

#!/bin/bash

grep PROMPT /etc/sysconfig/init

sed -i 's/PROMPT=yes/PROMPT=no/' /etc/sysconfig/init