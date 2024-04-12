###################################################
# 
# Group ID (Vulid):  V-38514
# Group Title:  SRG-OS-000096
# Rule ID:  SV-50315r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000124
# Rule Title: The Datagram Congestion Control Protocol (DCCP) must be disabled unless required.
# 
# Vulnerability Discussion:  Disabling DCCP protects the system against exploitation of any flaws in its implementation.
# 
# Check Content:  
# If the system is configured to prevent the loading of the "dccp" kernel module, it will contain lines inside any file in "/etc/modprobe.d" or the deprecated"/etc/modprobe.conf". These lines instruct the module loading system to run another program (such as "/bin/true") upon a module "install" event. Run the following command to search for such lines in all files in "/etc/modprobe.d" and the deprecated "/etc/modprobe.conf": 
# 
# $ grep -r dccp /etc/modprobe.conf /etc/modprobe.d
# 
# If no line is returned, this is a finding.
# 
# Fix Text: The Datagram Congestion Control Protocol (DCCP) is a relatively new transport layer protocol, designed to support streaming media and telephony. To configure the system to prevent the "dccp" kernel module from being loaded, add the following line to a file in the directory "/etc/modprobe.d": 
# 
# install dccp /bin/true   
# 
# CCI: CCI-000382
# 
###################################################

#!/bin/bash

grep -r dccp /etc/modprobe.conf /etc/modprobe.d

echo -e 'install dccp /bin/true' > /etc/modprobe.d/dccp