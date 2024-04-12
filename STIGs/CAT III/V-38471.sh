###################################################
# 
# Group ID (Vulid):  V-38471
# Group Title:  SRG-OS-000043
# Rule ID:  SV-50271r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000509
# Rule Title: The system must forward audit records to the syslog service.
# 
# Vulnerability Discussion:  The auditd service does not include the ability to send audit records to a centralized server for management directly. It does, however, include an audit event multiplexor plugin (audispd) to pass audit records to the local syslog server.
# 
# Check Content:  
# Verify the audispd plugin is active:
# 
# # grep active /etc/audisp/plugins.d/syslog.conf
# 
# If the "active" setting is missing or set to "no", this is a finding.
# 
# Fix Text: Set the "active" line in "/etc/audisp/plugins.d/syslog.conf" to "yes". Restart the auditd process.
# 
# # service auditd restart   
# 
# CCI: CCI-000136
# 
###################################################

#!/bin/bash

grep active /etc/audisp/plugins.d/syslog.conf