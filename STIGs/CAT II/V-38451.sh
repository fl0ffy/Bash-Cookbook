###################################################
# 
# Group ID (Vulid):  V-38451
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50251r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000040
# Rule Title: The /etc/passwd file must be group-owned by root.
# 
# Vulnerability Discussion:  The "/etc/passwd" file contains information about the users that are configured on the system. Protection of this file is critical for system security.
# 
# Check Content:  
# To check the group ownership of "/etc/passwd", run the command: 
# 
# $ ls -l /etc/passwd
# 
# If properly configured, the output should indicate the following group-owner. "root" 
# If it does not, this is a finding.
# 
# Fix Text: To properly set the group owner of "/etc/passwd", run the command: 
# 
# # chgrp root /etc/passwd   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

ls -l /etc/passwd