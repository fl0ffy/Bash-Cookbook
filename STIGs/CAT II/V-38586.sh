###################################################
# 
# Group ID (Vulid):  V-38586
# Group Title:  SRG-OS-000080
# Rule ID:  SV-50387r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000069
# Rule Title: The system must require authentication upon booting into single-user and maintenance modes.
# 
# Vulnerability Discussion:  This prevents attackers with physical access from trivially bypassing security on the machine and gaining root access. Such accesses are further prevented by configuring the bootloader password.
# 
# Check Content:  
# To check if authentication is required for single-user mode, run the following command: 
# 
# $ grep SINGLE /etc/sysconfig/init
# 
# The output should be the following: 
# 
# SINGLE=/sbin/sulogin
# 
# If the output is different, this is a finding.
# 
# Fix Text: Single-user mode is intended as a system recovery method, providing a single user root access to the system by providing a boot option at startup. By default, no authentication is performed if single-user mode is selected. 
# 
# To require entry of the root password even if the system is started in single-user mode, add or correct the following line in the file "/etc/sysconfig/init": 
# 
# SINGLE=/sbin/sulogin   
# 
# CCI: CCI-000213
# 
###################################################

#!/bin/bash

grep SINGLE /etc/sysconfig/init

sed -i 's/SINGLE=\/sbin\/sushell/SINGLE=\/sbin\/sulogin/' /etc/sysconfig/init