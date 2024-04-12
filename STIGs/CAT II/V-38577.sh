###################################################
# 
# Group ID (Vulid):  V-38577
# Group Title:  SRG-OS-000120
# Rule ID:  SV-50378r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000064
# Rule Title: The system must use a FIPS 140-2 approved cryptographic hashing algorithm for generating account password hashes (libuser.conf).
# 
# Vulnerability Discussion:  Using a stronger hashing algorithm makes password cracking attacks more difficult.
# 
# Check Content:  
# Inspect "/etc/libuser.conf" and ensure the following line appears in the "[default]" section: 
# 
# crypt_style = sha512
# 
# If it does not, this is a finding.
# 
# Fix Text: In "/etc/libuser.conf", add or correct the following line in its "[defaults]" section to ensure the system will use the SHA-512 algorithm for password hashing: 
# 
# crypt_style = sha512   
# 
# CCI: CCI-000803
# 
###################################################

#!/bin/bash

grep crypt_style /etc/libuser.conf
