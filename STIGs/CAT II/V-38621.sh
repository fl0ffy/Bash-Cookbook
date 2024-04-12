###################################################
# 
# Group ID (Vulid):  V-38621
# Group Title:  SRG-OS-000056
# Rule ID:  SV-50422r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000248
# Rule Title: The system clock must be synchronized to an authoritative DoD time source.
# 
# Vulnerability Discussion:  Synchronizing with an NTP server makes it possible to collate system logs from multiple sources or correlate computer events with real time events. Using a trusted NTP server provided by your organization is recommended.
# 
# Check Content:  
# A remote NTP server should be configured for time synchronization. To verify one is configured, open the following file. 
# 
# /etc/ntp.conf
# 
# In the file, there should be a section similar to the following: 
# 
# # --- OUR TIMESERVERS -----
# server [ntpserver]
# 
# If this is not the case, this is a finding.
# 
# Fix Text: To specify a remote NTP server for time synchronization, edit the file "/etc/ntp.conf". Add or correct the following lines, substituting the IP or hostname of a remote NTP server for ntpserver. 
# 
# server [ntpserver]
# 
# This instructs the NTP software to contact that remote server to obtain time data.   
# 
# CCI: CCI-000160
# 
###################################################

#!/bin/bash


