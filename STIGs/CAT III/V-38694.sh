###################################################
# 
# Group ID (Vulid):  V-38694
# Group Title:  SRG-OS-000118
# Rule ID:  SV-50495r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000335
# Rule Title: The operating system must manage information system identifiers for users and devices by disabling the user identifier after an organization defined time period of inactivity.
# 
# Vulnerability Discussion:  Disabling inactive accounts ensures that accounts which may not have been responsibly removed are not available to attackers who may have compromised their credentials.
# 
# Check Content:  
# To verify the "INACTIVE" setting, run the following command: 
# 
# grep "INACTIVE" /etc/default/useradd
# 
# The output should indicate the "INACTIVE" configuration option is set to an appropriate integer as shown in the example below: 
# 
# # grep "INACTIVE" /etc/default/useradd
# INACTIVE=35
# 
# If it does not, this is a finding.
# 
# Fix Text: To specify the number of days after a password expires (which signifies inactivity) until an account is permanently disabled, add or correct the following lines in "/etc/default/useradd", substituting "[NUM_DAYS]" appropriately: 
# 
# INACTIVE=[NUM_DAYS]
# 
# A value of 35 is recommended. If a password is currently on the verge of expiration, then 35 days remain until the account is automatically disabled. However, if the password will not expire for another 60 days, then 95 days could elapse until the account would be automatically disabled. See the "useradd" man page for more information. Determining the inactivity timeout must be done with careful consideration of the length of a "normal" period of inactivity for users in the particular environment. Setting the timeout too low incurs support costs and also has the potential to impact availability of the system to legitimate users.   
# 
# CCI: CCI-000795
# 
###################################################

#!/bin/bash

grep "INACTIVE" /etc/default/useradd