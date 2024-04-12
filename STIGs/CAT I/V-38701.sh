# ###################################################
# 
# Group ID (Vulid):  V-38701
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50502r1_rule
# Severity: CAT I
# Rule Version (STIG-ID):  RHEL-06-000338
# Rule Title: The TFTP daemon must operate in secure mode which provides access only to a single directory on the host file system.
# 
# Vulnerability Discussion:  Using the "-s" option causes the TFTP service to only serve files from the given directory. Serving files from an intentionally specified directory reduces the risk of sharing files which should remain private.
# 
# Check Content:  
# Verify "tftp" is configured by with the "-s" option by running the following command: 
# 
# grep "server_args" /etc/xinetd.d/tftp
# 
# The output should indicate the "server_args" variable is configured with the "-s" flag, matching the example below:
# 
# # grep "server_args" /etc/xinetd.d/tftp
# server_args = -s /var/lib/tftpboot
# 
# If it does not, this is a finding.
# 
# Fix Text: If running the "tftp" service is necessary, it should be configured to change its root directory at startup. To do so, ensure "/etc/xinetd.d/tftp" includes "-s" as a command line argument, as shown in the following example (which is also the default): 
# 
# server_args = -s /var/lib/tftpboot   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

grep "server_args" /etc/xinetd.d/tftp