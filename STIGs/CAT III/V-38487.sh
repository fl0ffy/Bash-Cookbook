###################################################
# 
# Group ID (Vulid):  V-38487
# Group Title:  SRG-OS-000103
# Rule ID:  SV-50288r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000015
# Rule Title: The system package management tool must cryptographically verify the authenticity of all software packages during installation.
# 
# Vulnerability Discussion:  Ensuring all packages' cryptographic signatures are valid prior to installation ensures the provenance of the software and protects against malicious tampering.
# 
# Check Content:  
# To determine whether "yum" has been configured to disable "gpgcheck" for any repos, inspect all files in "/etc/yum.repos.d" and ensure the following does not appear in any sections: 
# 
# gpgcheck=0
# 
# A value of "0" indicates that "gpgcheck" has been disabled for that repo. 
# If GPG checking is disabled, this is a finding.
# 
# If the "yum" system package management tool is not used to update the system, verify with the SA that installed packages are cryptographically signed.
# 
# Fix Text: To ensure signature checking is not disabled for any repos, remove any lines from files in "/etc/yum.repos.d" of the form: 
# 
# gpgcheck=0   
# 
# CCI: CCI-000663
# 
###################################################

#!/bin/bash

grep gpgcheck /etc/yum.repos.d/*

