###################################################
# 
# Group ID (Vulid):  V-38576
# Group Title:  SRG-OS-000120
# Rule ID:  SV-50377r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000063
# Rule Title: The system must use a FIPS 140-2 approved cryptographic hashing algorithm for generating account password hashes (login.defs).
# 
# Vulnerability Discussion:  Using a stronger hashing algorithm makes password cracking attacks more difficult.
# 
# Check Content:  
# Inspect "/etc/login.defs" and ensure the following line appears: 
# 
# ENCRYPT_METHOD SHA512
# 
# If it does not, this is a finding.
# 
# Fix Text: In "/etc/login.defs", add or correct the following line to ensure the system will use SHA-512 as the hashing algorithm: 
# 
# ENCRYPT_METHOD SHA512   
# 
# CCI: CCI-000803
# 
###################################################

#!/bin/bash

grep ENCRYPT /etc/login.defs