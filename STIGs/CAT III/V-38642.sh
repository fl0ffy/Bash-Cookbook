###################################################
# 
# Group ID (Vulid):  V-38642
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50443r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000346
# Rule Title: The system default umask for daemons must be 027 or 022.
# 
# Vulnerability Discussion:  The umask influences the permissions assigned to files created by a process at run time. An unnecessarily permissive umask could result in files being created with insecure permissions.
# 
# Check Content:  
# To check the value of the "umask", run the following command: 
# 
# $ grep umask /etc/init.d/functions
# 
# The output should show either "022" or "027". 
# If it does not, this is a finding.
# 
# Fix Text: The file "/etc/init.d/functions" includes initialization parameters for most or all daemons started at boot time. The default umask of 022 prevents creation of group- or world-writable files. To set the default umask for daemons, edit the following line, inserting 022 or 027 for [UMASK] appropriately: 
# 
# umask [UMASK]
# 
# Setting the umask to too restrictive a setting can cause serious errors at runtime. Many daemons on the system already individually restrict themselves to a umask of 077 in their own init scripts.   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

grep umask /etc/init.d/functions