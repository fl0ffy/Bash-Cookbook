###################################################
# 
# Group ID (Vulid):  V-38619
# Group Title:  SRG-OS-000073
# Rule ID:  SV-50420r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000347
# Rule Title: There must be no .netrc files on the system.
# 
# Vulnerability Discussion:  Unencrypted passwords for remote FTP servers may be stored in ".netrc" files. DoD policy requires passwords be encrypted in storage and not used in access scripts.
# 
# Check Content:  
# To check the system for the existence of any ".netrc" files, run the following command: 
# 
# # find /home -xdev -name .netrc
# 
# If any .netrc files exist, this is a finding.
# 
# Fix Text: The ".netrc" files contain login information used to auto-login into FTP servers and reside in the user's home directory. These files may contain unencrypted passwords to remote FTP servers making them susceptible to access by unauthorized users and should not be used. Any ".netrc" files should be removed.   
# 
# CCI: CCI-000196
# 
###################################################

#!/bin/bash

find /home -xdev -name .netrc