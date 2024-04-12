###################################################
# 
# Group ID (Vulid):  V-38515
# Group Title:  SRG-OS-000096
# Rule ID:  SV-50316r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000125
# Rule Title: The Stream Control Transmission Protocol (SCTP) must be disabled unless required.
# 
# Vulnerability Discussion:  Disabling SCTP protects the system against exploitation of any flaws in its implementation.
# 
# Check Content:  
# If the system is configured to prevent the loading of the "sctp" kernel module, it will contain lines inside any file in "/etc/modprobe.d" or the deprecated"/etc/modprobe.conf". These lines instruct the module loading system to run another program (such as "/bin/true") upon a module "install" event. Run the following command to search for such lines in all files in "/etc/modprobe.d" and the deprecated "/etc/modprobe.conf": 
# 
# $ grep -r sctp /etc/modprobe.conf /etc/modprobe.d
# 
# If no line is returned, this is a finding.
# 
# Fix Text: The Stream Control Transmission Protocol (SCTP) is a transport layer protocol, designed to support the idea of message-oriented communication, with several streams of messages within one connection. To configure the system to prevent the "sctp" kernel module from being loaded, add the following line to a file in the directory "/etc/modprobe.d": 
# 
# install sctp /bin/true   
# 
# CCI: CCI-000382
# 
###################################################

#!/bin/bash

grep -r sctp /etc/modprobe.conf /etc/modprobe.d

echo -e 'install sctp /bin/true' > /etc/modprobe.d/sctp