###################################################
# 
# Group ID (Vulid):  V-38494
# Group Title:  SRG-OS-000109
# Rule ID:  SV-50295r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000028
# Rule Title: The system must prevent the root account from logging in from serial consoles.
# 
# Vulnerability Discussion:  Preventing direct root login to serial port interfaces helps ensure accountability for actions taken on the systems using the root account.
# 
# Check Content:  
# To check for serial port entries which permit root login, run the following command: 
# 
# # grep '^ttyS[0-9]' /etc/securetty
# 
# If any output is returned, then root login over serial ports is permitted. 
# If root login over serial ports is permitted, this is a finding.
# 
# Fix Text: To restrict root logins on serial ports, ensure lines of this form do not appear in "/etc/securetty": 
# 
# ttyS0
# ttyS1
# 
# Note: Serial port entries are not limited to those listed above. Any lines starting with "ttyS" followed by numerals should be removed   
# 
# CCI: CCI-000770
# 
###################################################

#!/bin/bash

grep '^ttyS[0-9]' /etc/securetty
