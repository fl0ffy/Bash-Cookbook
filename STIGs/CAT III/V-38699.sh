###################################################
# 
# Group ID (Vulid):  V-38699
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50500r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000337
# Rule Title: All public directories must be owned by a system account.
# 
# Vulnerability Discussion:  Allowing a user account to own a world-writable directory is undesirable because it allows the owner of that directory to remove or replace any files that may be placed in the directory by other users.
# 
# Check Content:  
# The following command will discover and print world-writable directories that are not owned by a system account, given the assumption that only system accounts have a uid lower than 500. Run it once for each local partition [PART]: 
# 
# # find [PART] -xdev -type d -perm 0002 -uid +500 -print
# 
# If there is output, this is a finding.
# 
# Fix Text: All directories in local partitions which are world-writable should be owned by root or another system account. If any world-writable directories are not owned by a system account, this should be investigated. Following this, the files should be deleted or assigned to an appropriate group.   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

find [PART] -xdev -type d -perm 0002 -uid +500 -print