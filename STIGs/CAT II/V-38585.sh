###################################################
# 
# Group ID (Vulid):  V-38585
# Group Title:  SRG-OS-000080
# Rule ID:  SV-50386r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000068
# Rule Title: The system boot loader must require authentication.
# 
# Vulnerability Discussion:  Password protection on the boot loader configuration ensures users with physical access cannot trivially alter important bootloader settings. These include which kernel to use, and whether to enter single-user mode.
# 
# Check Content:  
# To verify the boot loader password has been set and encrypted, run the following command: 
# 
# # grep password /etc/grub.conf
# 
# The output should show the following: 
# 
# password --encrypted "$6$[rest-of-the-password-hash]"
# 
# If it does not, this is a finding.
# 
# Fix Text: The grub boot loader should have password protection enabled to protect boot-time settings. To do so, select a password and then generate a hash from it by running the following command: 
# 
# # grub-crypt --sha-512
# 
# When prompted to enter a password, insert the following line into "/etc/grub.conf" immediately after the header comments. (Use the output from "grub-crypt" as the value of [password-hash]): 
# 
# password --encrypted [password-hash]   
# 
# CCI: CCI-000213
# 
###################################################

#!/bin/bash

grep password /etc/grub.conf