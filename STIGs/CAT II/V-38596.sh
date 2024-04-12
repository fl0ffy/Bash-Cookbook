###################################################
# 
# Group ID (Vulid):  V-38596
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50397r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000078
# Rule Title: The system must implement virtual address space randomization.
# 
# Vulnerability Discussion:  Address space layout randomization (ASLR) makes it more difficult for an attacker to predict the location of attack code he or she has introduced into a process's address space during an attempt at exploitation. Additionally, ASLR also makes it more difficult for an attacker to know the location of existing code in order to repurpose it using return oriented programming (ROP) techniques.
# 
# Check Content:  
# The status of the "kernel.randomize_va_space" kernel parameter can be queried by running the following command: 
# 
# $ sysctl kernel.randomize_va_space
# 
# The output of the command should indicate a value of at least "1" (preferably "2"). If this value is not the default value, investigate how it could have been adjusted at runtime, and verify it is not set improperly in "/etc/sysctl.conf". 
# If the correct value is not returned, this is a finding.
# 
# Fix Text: To set the runtime status of the "kernel.randomize_va_space" kernel parameter, run the following command: 
# 
# # sysctl -w kernel.randomize_va_space=2
# 
# If this is not the system's default value, add the following line to "/etc/sysctl.conf": 
# 
# kernel.randomize_va_space = 2   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

sysctl kernel.randomize_va_space

