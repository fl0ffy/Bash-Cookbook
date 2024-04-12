###################################################
# 
# Group ID (Vulid):  V-38572
# Group Title:  SRG-OS-000072
# Rule ID:  SV-50373r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000060
# Rule Title: The system must require at least four characters be changed between the old and new passwords during a password change.
# 
# Vulnerability Discussion:  Requiring a minimum number of different characters during password changes ensures that newly changed passwords should not resemble previously compromised ones. Note that passwords which are changed on compromised systems will still be compromised, however.
# 
# Check Content:  
# To check how many characters must differ during a password change, run the following command: 
# 
# $ grep pam_cracklib /etc/pam.d/system-auth
# 
# The "difok" parameter will indicate how many characters must differ. The DoD requires four characters differ during a password change. This would appear as "difok=4". 
# If difok is not found or not set to the required value, this is a finding.
# 
# Fix Text: The pam_cracklib module's "difok" parameter controls requirements for usage of different characters during a password change. Add "difok=[NUM]" after pam_cracklib.so to require differing characters when changing passwords, substituting [NUM] appropriately. The DoD requirement is 4.   
# 
# CCI: CCI-000195
# 
###################################################

#!/bin/bash

grep pam_cracklib /etc/pam.d/system-auth
