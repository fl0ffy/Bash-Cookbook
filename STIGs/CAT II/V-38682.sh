###################################################
# 
# Group ID (Vulid):  V-38682
# Group Title:  SRG-OS-000034
# Rule ID:  SV-50483r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000315
# Rule Title: The Bluetooth kernel module must be disabled.
# 
# Vulnerability Discussion:  If Bluetooth functionality must be disabled, preventing the kernel from loading the kernel module provides an additional safeguard against its activation.
# 
# Check Content:  
# If the system is configured to prevent the loading of the "bluetooth" kernel module, it will contain lines inside any file in "/etc/modprobe.d" or the deprecated"/etc/modprobe.conf". These lines instruct the module loading system to run another program (such as "/bin/true") upon a module "install" event. Run the following command to search for such lines in all files in "/etc/modprobe.d" and the deprecated "/etc/modprobe.conf": 
# 
# $ grep -r bluetooth /etc/modprobe.conf /etc/modprobe.d
# 
# If the system is configured to prevent the loading of the "net-pf-31" kernel module, it will contain lines inside any file in "/etc/modprobe.d" or the deprecated"/etc/modprobe.conf". These lines instruct the module loading system to run another program (such as "/bin/true") upon a module "install" event. Run the following command to search for such lines in all files in "/etc/modprobe.d" and the deprecated "/etc/modprobe.conf": 
# 
# $ grep -r net-pf-31 /etc/modprobe.conf /etc/modprobe.d
# 
# If no line is returned, this is a finding.
# 
# Fix Text: The kernel's module loading system can be configured to prevent loading of the Bluetooth module. Add the following to the appropriate "/etc/modprobe.d" configuration file to prevent the loading of the Bluetooth module: 
# 
# install net-pf-31 /bin/true
# install bluetooth /bin/true   
# 
# CCI: CCI-000085
# 
###################################################

#!/bin/bash

grep -r bluetooth /etc/modprobe.conf /etc/modprobe.d
grep -r net-pf-31 /etc/modprobe.conf /etc/modprobe.d

echo 'install net-pf-31 /bin/true' >> /etc/modprobe.d/bluetooth
echo 'install bluetooth /bin/true' >> /etc/modprobe.d/bluetooth