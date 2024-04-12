# ###################################################
# 
# Group ID (Vulid):  V-38491
# Group Title:  SRG-OS-000248
# Rule ID:  SV-50292r1_rule
# Severity: CAT I
# Rule Version (STIG-ID):  RHEL-06-000019
# Rule Title: There must be no .rhosts or hosts.equiv files on the system.
# 
# Vulnerability Discussion:  Trust files are convenient, but when used in conjunction with the R-services, they can allow unauthenticated access to a system.
# 
# Check Content:  
# The existence of the file "/etc/hosts.equiv" or a file named ".rhosts" inside a user home directory indicates the presence of an Rsh trust relationship. 
# If these files exist, this is a finding.
# 
# Fix Text: The files "/etc/hosts.equiv" and "~/.rhosts" (in each user's home directory) list remote hosts and users that are trusted by the local system when using the rshd daemon. To remove these files, run the following command to delete them from any location. 
# 
# # rm /etc/hosts.equiv
# 
# $ rm ~/.rhosts   
# 
# CCI: CCI-001436
# 
###################################################

#!/bin/bash

find /etc -name "hosts.equiv"
find /home -name ".rhosts"