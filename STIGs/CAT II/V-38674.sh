###################################################
# 
# Group ID (Vulid):  V-38674
# Group Title:  SRG-OS-000248
# Rule ID:  SV-50475r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000290
# Rule Title: X Windows must not be enabled unless required.
# 
# Vulnerability Discussion:  Unnecessary services should be disabled to decrease the attack surface of the system.
# 
# Check Content:  
# To verify the default runlevel is 3, run the following command: 
# 
# # grep initdefault /etc/inittab
# 
# The output should show the following: 
# 
# id:3:initdefault:
# 
# If it does not, this is a finding.
# 
# Fix Text: Setting the system's runlevel to 3 will prevent automatic startup of the X server. To do so, ensure the following line in "/etc/inittab" features a "3" as shown: 
# 
# id:3:initdefault:   
# 
# CCI: CCI-001436
# 
###################################################

#!/bin/bash

grep initdefault /etc/inittab