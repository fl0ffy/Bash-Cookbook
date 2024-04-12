###################################################
# 
# Group ID (Vulid):  V-38685
# Group Title:  SRG-OS-000002
# Rule ID:  SV-50486r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000297
# Rule Title: Temporary accounts must be provisioned with an expiration date.
# 
# Vulnerability Discussion:  When temporary accounts are created, there is a risk they may remain in place and active after the need for them no longer exists. Account expiration greatly reduces the risk of accounts being misused or hijacked.
# 
# Check Content:  
# For every temporary account, run the following command to obtain its account aging and expiration information: 
# 
# # chage -l [USER]
# 
# Verify each of these accounts has an expiration date set as documented. 
# If any temporary accounts have no expiration date set or do not expire within a documented time frame, this is a finding.
# 
# Fix Text: In the event temporary accounts are required, configure the system to terminate them after a documented time period. For every temporary account, run the following command to set an expiration date on it, substituting "[USER]" and "[YYYY-MM-DD]" appropriately: 
# 
# # chage -E [YYYY-MM-DD] [USER]
# 
# "[YYYY-MM-DD]" indicates the documented expiration date for the account.   
# 
# CCI: CCI-000016
# 
###################################################

#!/bin/bash

chage -l [USER]