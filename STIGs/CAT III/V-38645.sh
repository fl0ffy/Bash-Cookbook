###################################################
# 
# Group ID (Vulid):  V-38645
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50446r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000345
# Rule Title: The system default umask in /etc/login.defs must be 077.
# 
# Vulnerability Discussion:  The umask value influences the permissions assigned to files when they are created. A misconfigured umask value could result in files with excessive permissions that can be read and/or written to by unauthorized users.
# 
# Check Content:  
# Verify the "umask" setting is configured correctly in the "/etc/login.defs" file by running the following command: 
# 
# # grep -i "umask" /etc/login.defs
# 
# All output must show the value of "umask" set to 077, as shown in the below: 
# 
# # grep -i "umask" /etc/login.defs
# UMASK 077
# 
# If the above command returns no output, or if the umask is configured incorrectly, this is a finding.
# 
# Fix Text: To ensure the default umask controlled by "/etc/login.defs" is set properly, add or correct the "umask" setting in "/etc/login.defs" to read as follows: 
# 
# UMASK 077   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

grep -i "umask" /etc/login.defs
