###################################################
# 
# Group ID (Vulid):  V-38643
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50444r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000282
# Rule Title: There must be no world-writable files on the system.
# 
# Vulnerability Discussion:  Data in world-writable files can be modified by any user on the system. In almost all circumstances, files can be configured using a combination of user and group permissions to support whatever legitimate access is needed without the risk caused by world-writable files.
# 
# Check Content:  
# To find world-writable files, run the following command: 
# 
# # find / -xdev -type f -perm -002
# 
# If there is output, this is a finding.
# 
# Fix Text: It is generally a good idea to remove global (other) write access to a file when it is discovered. However, check with documentation for specific applications before making changes. Also, monitor for recurring world-writable files, as these may be symptoms of a misconfigured application or user account.   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

find / -xdev -type f -perm -002