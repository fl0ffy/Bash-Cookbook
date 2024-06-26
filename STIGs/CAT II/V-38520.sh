###################################################
# 
# Group ID (Vulid):  V-38520
# Group Title:  SRG-OS-000215
# Rule ID:  SV-50321r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000136
# Rule Title: The operating system must back up audit records on an organization defined frequency onto a different system or media than the system being audited.
# 
# Vulnerability Discussion:  A log server (loghost) receives syslog messages from one or more systems. This data can be used as an additional log source in the event a system is compromised and its local logs are suspect. Forwarding log messages to a remote loghost also provides system administrators with a centralized place to view the status of multiple hosts within the enterprise.
# 
# Check Content:  
# To ensure logs are sent to a remote host, examine the file "/etc/rsyslog.conf". If using UDP, a line similar to the following should be present: 
# 
# *.* @[loghost.example.com]
# 
# If using TCP, a line similar to the following should be present: 
# 
# *.* @@[loghost.example.com]
# 
# If using RELP, a line similar to the following should be present: 
# 
# *.* :omrelp:[loghost.example.com]
# 
# If none of these are present, this is a finding.
# 
# Fix Text: To configure rsyslog to send logs to a remote log server, open "/etc/rsyslog.conf" and read and understand the last section of the file, which describes the multiple directives necessary to activate remote logging. Along with these other directives, the system can be configured to forward its logs to a particular log server by adding or correcting one of the following lines, substituting "[loghost.example.com]" appropriately. The choice of protocol depends on the environment of the system; although TCP and RELP provide more reliable message delivery, they may not be supported in all environments. 
# To use UDP for log message delivery: 
# 
# *.* @[loghost.example.com]
# 
# To use TCP for log message delivery: 
# 
# *.* @@[loghost.example.com]
# 
# To use RELP for log message delivery: 
# 
# *.* :omrelp:[loghost.example.com]   
# 
# CCI: CCI-001348
# 
###################################################

#!/bin/bash

less /etc/rsyslog.conf

