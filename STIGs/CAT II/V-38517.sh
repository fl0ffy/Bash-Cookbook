###################################################
# 
# Group ID (Vulid):  V-38517
# Group Title:  SRG-OS-000096
# Rule ID:  SV-50318r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000127
# Rule Title: The Transparent Inter-Process Communication (TIPC) protocol must be disabled unless required.
# 
# Vulnerability Discussion:  Disabling TIPC protects the system against exploitation of any flaws in its implementation.
# 
# Check Content:  
# If the system is configured to prevent the loading of the "tipc" kernel module, it will contain lines inside any file in "/etc/modprobe.d" or the deprecated"/etc/modprobe.conf". These lines instruct the module loading system to run another program (such as "/bin/true") upon a module "install" event. Run the following command to search for such lines in all files in "/etc/modprobe.d" and the deprecated "/etc/modprobe.conf": 
# 
# $ grep -r tipc /etc/modprobe.conf /etc/modprobe.d
# 
# If no line is returned, this is a finding.
# 
# Fix Text: The Transparent Inter-Process Communication (TIPC) protocol is designed to provide communications between nodes in a cluster. To configure the system to prevent the "tipc" kernel module from being loaded, add the following line to a file in the directory "/etc/modprobe.d": 
# 
# install tipc /bin/true   
# 
# CCI: CCI-000382
# 
###################################################

#!/bin/bash

grep -r tipc /etc/modprobe.conf /etc/modprobe.d

echo 'install tipc /bin/true' > /etc/modprobe.d/tipc