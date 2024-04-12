# ###################################################
# 
# Group ID (Vulid):  V-38462
# Group Title:  SRG-OS-000090
# Rule ID:  SV-50262r1_rule
# Severity: CAT I
# Rule Version (STIG-ID):  RHEL-06-000514
# Rule Title: The RPM package management tool must cryptographically verify the authenticity of all software packages during installation.
# 
# Vulnerability Discussion:  Ensuring all packages' cryptographic signatures are valid prior to installation ensures the provenance of the software and protects against malicious tampering.
# 
# Check Content:  
# Verify RPM signature validation is not disabled:
# # grep nosignature /etc/rpmrc /usr/lib/rpm/rpmrc /usr/lib/rpm/redhat/rpmrc ~root/.rpmrc
# If any configuration is found, this is a finding.
# 
# Fix Text: Edit the RPM configuration files containing the "nosignature" option and remove the option.   
# 
# CCI: CCI-000352
# 
###################################################

#!/bin/bash

grep nosignature /etc/rpmrc /usr/lib/rpm/rpmrc /usr/lib/rpm/redhat/rpmrc ~root/.rpmrc