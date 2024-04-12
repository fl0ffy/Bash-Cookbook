###################################################
# 
# Group ID (Vulid):  V-38649
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50450r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000343
# Rule Title: The system default umask for the csh shell must be 077.
# 
# Vulnerability Discussion:  The umask value influences the permissions assigned to files when they are created. A misconfigured umask value could result in files with excessive permissions that can be read and/or written to by unauthorized users.
# 
# Check Content:  
# Verify the "umask" setting is configured correctly in the "/etc/csh.cshrc" file by running the following command: 
# 
# # grep "umask" /etc/csh.cshrc
# 
# All output must show the value of "umask" set to 077, as shown in the below: 
# 
# # grep "umask" /etc/csh.cshrc
# umask 077
# 
# If the above command returns no output, or if the umask is configured incorrectly, this is a finding.
# 
# Fix Text: To ensure the default umask for users of the C shell is set properly, add or correct the "umask" setting in "/etc/csh.cshrc" to read as follows: 
# 
# umask 077   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

grep "umask" /etc/csh.cshrc