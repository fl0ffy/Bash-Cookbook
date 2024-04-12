###################################################
# 
# Group ID (Vulid):  V-38546
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50347r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000098
# Rule Title: The IPv6 protocol handler must not be bound to the network stack unless needed.
# 
# Vulnerability Discussion:  Any unnecessary network stacks - including IPv6 - should be disabled, to reduce the vulnerability to exploitation.
# 
# Check Content:  
# If the system uses IPv6, this is not applicable.
# 
# If the system is configured to prevent the loading of the "ipv6" kernel module, it will contain a line of the form: 
# 
# options ipv6 disable=1
# 
# Such lines may be inside any file in "/etc/modprobe.d" or the deprecated "/etc/modprobe.conf". This permits insertion of the IPv6 kernel module (which other parts of the system expect to be present), but otherwise keeps it inactive. Run the following command to search for such lines in all files in "/etc/modprobe.d" and the deprecated "/etc/modprobe.conf": 
# 
# $ grep -r ipv6 /etc/modprobe.conf /etc/modprobe.d
# 
# If the IPv6 kernel module is loaded, this is a finding.
# 
# Fix Text: To prevent the IPv6 kernel module ("ipv6") from loading the IPv6 networking stack, add the following line to "/etc/modprobe.d/disabled.conf" (or another file in "/etc/modprobe.d"): 
# 
# options ipv6 disable=1
# 
# This permits the IPv6 module to be loaded (and thus satisfy other modules that depend on it), while disabling support for the IPv6 protocol.   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

grep -r ipv6 /etc/modprobe.conf /etc/modprobe.d

ehco 'options ipv6 disable=1' > /etc/modprobe.d/ipv6