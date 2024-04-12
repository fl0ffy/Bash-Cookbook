###################################################
# 
# Group ID (Vulid):  V-38438
# Group Title:  SRG-OS-000062
# Rule ID:  SV-50238r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000525
# Rule Title: Auditing must be enabled at boot by setting a kernel parameter.
# 
# Vulnerability Discussion:  Each process on the system carries an "auditable" flag which indicates whether its activities can be audited. Although "auditd" takes care of enabling this for all processes which launch after it does, adding the kernel argument ensures it is set for every process during boot.
# 
# Check Content:  
# Inspect the kernel boot arguments (which follow the word "kernel") in "/etc/grub.conf". If they include "audit=1", then auditing is enabled at boot time. 
# If auditing is not enabled at boot time, this is a finding.
# 
# Fix Text: To ensure all processes can be audited, even those which start prior to the audit daemon, add the argument "audit=1" to the kernel line in "/etc/grub.conf", in the manner below: 
# 
# kernel /vmlinuz-version ro vga=ext root=/dev/VolGroup00/LogVol00 rhgb quiet audit=1   
# 
# CCI: CCI-000169
# 
###################################################

#!/bin/bash

grep audit /etc/grub.conf

