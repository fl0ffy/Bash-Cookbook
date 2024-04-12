###################################################
# 
# Group ID (Vulid):  V-38647
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50448r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000344
# Rule Title: The system default umask in /etc/profile must be 077.
# 
# Vulnerability Discussion:  The umask value influences the permissions assigned to files when they are created. A misconfigured umask value could result in files with excessive permissions that can be read and/or written to by unauthorized users.
# 
# Check Content:  
# Verify the "umask" setting is configured correctly in the "/etc/profile" file by running the following command: 
# 
# # grep "umask" /etc/profile
# 
# All output must show the value of "umask" set to 077, as shown in the below: 
# 
# # grep "umask" /etc/profile
# umask 077
# 
# If the above command returns no output, or if the umask is configured incorrectly, this is a finding.
# 
# Fix Text: To ensure the default umask controlled by "/etc/profile" is set properly, add or correct the "umask" setting in "/etc/profile" to read as follows: 
# 
# umask 077   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

grep "umask" /etc/profile