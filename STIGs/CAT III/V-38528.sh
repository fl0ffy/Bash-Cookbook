###################################################
# 
# Group ID (Vulid):  V-38528
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50329r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000088
# Rule Title: The system must log Martian packets.
# 
# Vulnerability Discussion:  The presence of "martian" packets (which have impossible addresses) as well as spoofed packets, source-routed packets, and redirects could be a sign of nefarious network activity. Logging these packets enables this activity to be detected.
# 
# Check Content:  
# The status of the "net.ipv4.conf.all.log_martians" kernel parameter can be queried by running the following command: 
# 
# $ sysctl net.ipv4.conf.all.log_martians
# 
# The output of the command should indicate a value of "1". If this value is not the default value, investigate how it could have been adjusted at runtime, and verify it is not set improperly in "/etc/sysctl.conf". 
# If the correct value is not returned, this is a finding.
# 
# Fix Text: To set the runtime status of the "net.ipv4.conf.all.log_martians" kernel parameter, run the following command: 
# 
# # sysctl -w net.ipv4.conf.all.log_martians=1
# 
# If this is not the system's default value, add the following line to "/etc/sysctl.conf": 
# 
# net.ipv4.conf.all.log_martians = 1   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

sysctl net.ipv4.conf.all.log_martians

sysctl -w net.ipv4.conf.all.log_martians=1

echo ""  >> /etc/sysctl.conf
echo '# controls the logging of Martian packets' >> /etc/sysctl.conf
ehco 'net.ipv4.conf.all.log_martians = 1' >> /etc/sysctl.conf