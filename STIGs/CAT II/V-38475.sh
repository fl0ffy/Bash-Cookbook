###################################################
# 
# Group ID (Vulid):  V-38475
# Group Title:  SRG-OS-000078
# Rule ID:  SV-50275r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000050
# Rule Title: The system must require passwords to contain a minimum of 14 characters.
# 
# Vulnerability Discussion:  Requiring a minimum password length makes password cracking attacks more difficult by ensuring a larger search space. However, any security benefit from an onerous requirement must be carefully weighed against usability problems, support costs, or counterproductive behavior that may result.
# 
# While it does not negate the password length requirement, it is preferable to migrate from a password-based authentication scheme to a stronger one based on PKI (public key infrastructure).
# 
# Check Content:  
# To check the minimum password length, run the command: 
# 
# $ grep PASS_MIN_LEN /etc/login.defs
# 
# The DoD requirement is "14". 
# If it is not set to the required value, this is a finding.
# 
# Fix Text: To specify password length requirements for new accounts, edit the file "/etc/login.defs" and add or correct the following lines: 
# 
# PASS_MIN_LEN 14
# 
# The DoD requirement is "14". If a program consults "/etc/login.defs" and also another PAM module (such as "pam_cracklib") during a password change operation, then the most restrictive must be satisfied.   
# 
# CCI: CCI-000205
# 
###################################################

#!/bin/bash

grep PASS_MIN_LEN /etc/login.defs