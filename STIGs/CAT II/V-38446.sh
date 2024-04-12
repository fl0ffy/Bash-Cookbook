###################################################
# 
# Group ID (Vulid):  V-38446
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50246r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000521
# Rule Title: The mail system must forward all mail for root to one or more system administrators.
# 
# Vulnerability Discussion:  A number of system services utilize email messages sent to the root user to notify system administrators of active or impending issues. These messages must be forwarded to at least one monitored email address.
# 
# Check Content:  
# Find the list of alias maps used by the Postfix mail server:
# 
# # postconf alias_maps
# 
# Query the Postfix alias maps for an alias for "root":
# 
# # postmap -q root <alias_map>
# 
# If there are no aliases configured for root that forward to a monitored email address, this is a finding.
# 
# Fix Text: Set up an alias for root that forwards to a monitored email address:
# 
# # echo "root: <system.administrator>@mail.mil" >> /etc/aliases
# # newaliases   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

postconf alias_maps
postmap -q root <alias_map>