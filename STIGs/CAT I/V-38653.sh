# ###################################################
# 
# Group ID (Vulid):  V-38653
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50454r1_rule
# Severity: CAT I
# Rule Version (STIG-ID):  RHEL-06-000341
# Rule Title: The snmpd service must not use a default password.
# 
# Vulnerability Discussion:  Presence of the default SNMP password enables querying of different system aspects and could result in unauthorized knowledge of the system.
# 
# Check Content:  
# To ensure the default password is not set, run the following command: 
# 
# # grep -v "^#" /etc/snmp/snmpd.conf| grep public
# 
# There should be no output. 
# If there is output, this is a finding.
# 
# Fix Text: Edit "/etc/snmp/snmpd.conf", remove default community string "public". Upon doing that, restart the SNMP service: 
# 
# # service snmpd restart   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

grep -v "^#" /etc/snmp/snmpd.conf| grep public