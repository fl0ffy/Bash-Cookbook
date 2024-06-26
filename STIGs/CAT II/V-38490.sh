###################################################
# 
# Group ID (Vulid):  V-38490
# Group Title:  SRG-OS-000273
# Rule ID:  SV-50291r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000503
# Rule Title: The operating system must enforce requirements for the connection of mobile devices to operating systems.
# 
# Vulnerability Discussion:  USB storage devices such as thumb drives can be used to introduce unauthorized software and other vulnerabilities. Support for these devices should be disabled and the devices themselves should be tightly controlled.
# 
# Check Content:  
# If the system is configured to prevent the loading of the "usb-storage" kernel module, it will contain lines inside any file in "/etc/modprobe.d" or the deprecated"/etc/modprobe.conf". These lines instruct the module loading system to run another program (such as "/bin/true") upon a module "install" event. Run the following command to search for such lines in all files in "/etc/modprobe.d" and the deprecated "/etc/modprobe.conf": 
# 
# $ grep -r usb-storage /etc/modprobe.conf /etc/modprobe.d
# 
# If no line is returned, this is a finding.
# 
# Fix Text: To prevent USB storage devices from being used, configure the kernel module loading system to prevent automatic loading of the USB storage driver. To configure the system to prevent the "usb-storage" kernel module from being loaded, add the following line to a file in the directory "/etc/modprobe.d": 
# 
# install usb-storage /bin/true
# 
# This will prevent the "modprobe" program from loading the "usb-storage" module, but will not prevent an administrator (or another program) from using the "insmod" program to load the module manually.  
# 
#  
###################################################

#!/bin/bash

grep -r usb-storage /etc/modprobe.conf /etc/modprobe.d