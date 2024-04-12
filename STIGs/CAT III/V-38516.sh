###################################################
# 
# Group ID (Vulid):  V-38516
# Group Title:  SRG-OS-000096
# Rule ID:  SV-50317r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000126
# Rule Title: The Reliable Datagram Sockets (RDS) protocol must be disabled unless required.
# 
# Vulnerability Discussion:  Disabling RDS protects the system against exploitation of any flaws in its implementation.
# 
# Check Content:  
# If the system is configured to prevent the loading of the "rds" kernel module, it will contain lines inside any file in "/etc/modprobe.d" or the deprecated"/etc/modprobe.conf". These lines instruct the module loading system to run another program (such as "/bin/true") upon a module "install" event. Run the following command to search for such lines in all files in "/etc/modprobe.d" and the deprecated "/etc/modprobe.conf": 
# 
# $ grep -r rds /etc/modprobe.conf /etc/modprobe.d
# 
# If no line is returned, this is a finding.
# 
# Fix Text: The Reliable Datagram Sockets (RDS) protocol is a transport layer protocol designed to provide reliable high- bandwidth, low-latency communications between nodes in a cluster. To configure the system to prevent the "rds" kernel module from being loaded, add the following line to a file in the directory "/etc/modprobe.d": 
# 
# install rds /bin/true   
# 
# CCI: CCI-000382
# 
###################################################

#!/bin/bash

grep -r rds /etc/modprobe.conf /etc/modprobe.d

ehco 'install rds /bin/true' > /etc/modprobe.d/rds