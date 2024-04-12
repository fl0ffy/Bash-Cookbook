###################################################
# 
# Group ID (Vulid):  V-38584
# Group Title:  SRG-OS-000096
# Rule ID:  SV-50385r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000204
# Rule Title: The xinetd service must be uninstalled if no network services utilizing it are enabled.
# 
# Vulnerability Discussion:  Removing the "xinetd" package decreases the risk of the xinetd service's accidental (or intentional) activation.
# 
# Check Content:  
# If network services are using the xinetd service, this is not applicable.
# 
# Run the following command to determine if the "xinetd" package is installed: 
# 
# # rpm -q xinetd
# 
# If the package is installed, this is a finding.
# 
# Fix Text: The "xinetd" package can be uninstalled with the following command: 
# 
# # yum erase xinetd   
# 
# CCI: CCI-000382
# 
###################################################

#!/bin/bash

rpm -q xinetd

