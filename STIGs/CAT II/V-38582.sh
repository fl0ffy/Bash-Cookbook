###################################################
# 
# Group ID (Vulid):  V-38582
# Group Title:  SRG-OS-000096
# Rule ID:  SV-50383r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000203
# Rule Title: The xinetd service must be disabled if no network services utilizing it are enabled.
# 
# Vulnerability Discussion:  The xinetd service provides a dedicated listener service for some programs, which is no longer necessary for commonly-used network services. Disabling it ensures that these uncommon services are not running, and also prevents attacks against xinetd itself.
# 
# Check Content:  
# If network services are using the xinetd service, this is not applicable.
# 
# To check that the "xinetd" service is disabled in system boot configuration, run the following command: 
# 
# # chkconfig "xinetd" --list
# 
# Output should indicate the "xinetd" service has either not been installed, or has been disabled at all runlevels, as shown in the example below: 
# 
# # chkconfig "xinetd" --list
# "xinetd" 0:off 1:off 2:off 3:off 4:off 5:off 6:off
# 
# Run the following command to verify "xinetd" is disabled through current runtime configuration: 
# 
# # service xinetd status
# 
# If the service is disabled the command will return the following output: 
# 
# xinetd is stopped
# 
# If the service is running, this is a finding.
# 
# Fix Text: The "xinetd" service can be disabled with the following command: 
# 
# # chkconfig xinetd off   
# 
# CCI: CCI-000382
# 
###################################################

#!/bin/bash

chkconfig "xinetd" --list