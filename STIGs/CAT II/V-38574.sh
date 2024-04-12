###################################################
# 
# Group ID (Vulid):  V-38574
# Group Title:  SRG-OS-000120
# Rule ID:  SV-50375r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000062
# Rule Title: The system must use a FIPS 140-2 approved cryptographic hashing algorithm for generating account password hashes (system-auth).
# 
# Vulnerability Discussion:  Using a stronger hashing algorithm makes password cracking attacks more difficult.
# 
# Check Content:  
# Inspect the "password" section of "/etc/pam.d/system-auth" and ensure that the "pam_unix.so" module includes the argument "sha512".
# 
# $ grep sha512 /etc/pam.d/system-auth
# 
# If it does not, this is a finding.
# 
# Fix Text: In "/etc/pam.d/system-auth", the "password" section of the file controls which PAM modules execute during a password change. Set the "pam_unix.so" module in the "password" section to include the argument "sha512", as shown below: 
# 
# password sufficient pam_unix.so sha512 [other arguments...]
# 
# This will help ensure when local users change their passwords, hashes for the new passwords will be generated using the SHA-512 algorithm. This is the default.
# 
# Note that any updates made to "/etc/pam.d/system-auth" will be overwritten by the "authconfig" program. The "authconfig" program should not be used.   
# 
# CCI: CCI-000803
# 
###################################################

#!/bin/bash

grep sha512 /etc/pam.d/system-auth