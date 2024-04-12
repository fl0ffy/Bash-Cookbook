###################################################
# 
# Group ID (Vulid):  V-38660
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50461r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000340
# Rule Title: The snmpd service must use only SNMP protocol version 3 or newer.
# 
# Vulnerability Discussion:  Earlier versions of SNMP are considered insecure, as they potentially allow unauthorized access to detailed system management information.
# 
# Check Content:  
# To ensure only SNMPv3 or newer is used, run the following command: 
# 
# # grep 'v1\|v2c\|com2sec' /etc/snmp/snmpd.conf | grep -v '^#'
# 
# There should be no output. 
# If there is output, this is a finding.
# 
# Fix Text: Edit "/etc/snmp/snmpd.conf", removing any references to "v1", "v2c", or "com2sec". Upon doing that, restart the SNMP service: 
# 
# # service snmpd restart   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

grep 'v1\|v2c\|com2sec' /etc/snmp/snmpd.conf | grep -v '^#'