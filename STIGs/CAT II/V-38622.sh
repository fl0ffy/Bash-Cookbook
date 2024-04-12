###################################################
# 
# Group ID (Vulid):  V-38622
# Group Title:  SRG-OS-000096
# Rule ID:  SV-50423r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000249
# Rule Title: Mail relaying must be restricted.
# 
# Vulnerability Discussion:  This ensures "postfix" accepts mail messages (such as cron job reports) from the local system only, and not from the network, which protects it from network attack.
# 
# Check Content:  
# Run the following command to ensure postfix accepts mail messages from only the local system: 
# 
# $ grep inet_interfaces /etc/postfix/main.cf
# 
# If properly configured, the output should show only "localhost". 
# If it does not, this is a finding.
# 
# Fix Text: Edit the file "/etc/postfix/main.cf" to ensure that only the following "inet_interfaces" line appears: 
# 
# inet_interfaces = localhost   
# 
# CCI: CCI-000382
# 
###################################################

#!/bin/bash

grep inet_interfaces /etc/postfix/main.cf | grep -v "^#"