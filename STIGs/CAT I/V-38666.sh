###################################################
# 
# Group ID (Vulid):  V-38666
# Group Title:  SRG-OS-000270
# Rule ID:  SV-50467r1_rule
# Severity: CAT I
# Rule Version (STIG-ID):  RHEL-06-000284
# Rule Title: The system must use and update a DoD-approved virus scan program.
# 
# Vulnerability Discussion:  Virus scanning software can be used to detect if a system has been compromised by computer viruses, as well as to limit their spread to other systems.
# 
# Check Content:  
# Inspect the system for a cron job or system service which executes a virus scanning tool regularly. 
# To verify the McAfee command line scan tool (uvscan) is scheduled for regular execution, run the following command to check for a cron job: 
# 
# # grep uvscan /etc/cron* /var/spool/cron/*
# 
# This will reveal if and when the uvscan program will be run. 
# To check on the age of uvscan virus definition files, run the following command: 
# 
# # cd /usr/local/uvscan
# # ls -la avvscan.dat avvnames.dat avvclean.dat
# 
# The uvscan virus definitions should not be older than seven days.
# 
# If virus scanning software does not run daily, or has signatures that are out of date, this is a finding.
# 
# Fix Text: Install virus scanning software, which uses signatures to search for the presence of viruses on the filesystem. The McAfee uvscan virus scanning tool is provided for DoD systems. Ensure virus definition files are no older than 7 days, or their last release. Configure the virus scanning software to perform scans dynamically on all accessed files. If this is not possible, configure the system to scan all altered files on the system on a daily basis. If the system processes inbound SMTP mail, configure the virus scanner to scan all received mail.   
# 
# CCI: CCI-001668
# 
###################################################

#!/bin/bash

grep uvscan /etc/cron* /var/spool/cron/*

cd /usr/local/uvscan
ls -la avvscan.dat avvnames.dat avvclean.dat