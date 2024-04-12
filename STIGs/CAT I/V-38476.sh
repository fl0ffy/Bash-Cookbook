# ###################################################
# 
# Group ID (Vulid):  V-38476
# Group Title:  SRG-OS-000090
# Rule ID:  SV-50276r1_rule
# Severity: CAT I
# Rule Version (STIG-ID):  RHEL-06-000008
# Rule Title: Vendor-provided cryptographic certificates must be installed to verify the integrity of system software.
# 
# Vulnerability Discussion:  This key is necessary to cryptographically verify packages are from Red Hat.
# 
# Check Content:  
# To ensure that the GPG key is installed, run: 
# 
# $ rpm -q --queryformat "%{SUMMARY}\n" gpg-pubkey
# 
# The command should return the string below: 
# 
# gpg(Red Hat, Inc. (release key <security@redhat.com>)
# 
# If the Red Hat GPG Key is not installed, this is a finding.
# 
# Fix Text: To ensure the system can cryptographically verify base software packages come from Red Hat (and to connect to the Red Hat Network to receive them if desired), the Red Hat GPG key must properly be installed. To ensure the GPG key is installed, run: 
# 
# # rhn_register   
# 
# CCI: CCI-000352
# 
###################################################

#!/bin/bash


rpm -q --queryformat "%{SUMMARY}\n" gpg-pubkey