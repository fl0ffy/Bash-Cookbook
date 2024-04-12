###################################################
# 
# Group ID (Vulid):  V-38684
# Group Title:  SRG-OS-000027
# Rule ID:  SV-50485r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000319
# Rule Title: The system must limit users to 10 simultaneous system logins, or a site-defined number, in accordance with operational requirements.
# 
# Vulnerability Discussion:  Limiting simultaneous user logins can insulate the system from denial of service problems caused by excessive logins. Automated login processes operating improperly or maliciously may result in an exceptional number of simultaneous login sessions.
# 
# Check Content:  
# Run the following command to ensure the "maxlogins" value is configured for all users on the system: 
# 
# # grep "maxlogins" /etc/security/limits.conf
# 
# You should receive output similar to the following: 
# 
# * hard maxlogins 10
# 
# If it is not set to 10 or a documented site-defined number, this is a finding.
# 
# Fix Text: Limiting the number of allowed users and sessions per user can limit risks related to denial of service attacks. This addresses concurrent sessions for a single account and does not address concurrent sessions by a single user via multiple accounts. To set the number of concurrent sessions per user add the following line in "/etc/security/limits.conf": 
# 
# * hard maxlogins 10
# 
# A documented site-defined number may be substituted for 10 in the above.   
# 
# CCI: CCI-000054
# 
###################################################

#!/bin/bash


grep "maxlogins" /etc/security/limits.conf