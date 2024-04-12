###################################################
# 
# Group ID (Vulid):  V-38540
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50341r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000182
# Rule Title: The audit system must be configured to audit modifications to the systems network configuration.
# 
# Vulnerability Discussion:  The network environment should not be modified by anything other than administrator action. Any change to network parameters should be audited.
# 
# Check Content:  
# To determine if the system is configured to audit changes to its network configuration, run the following command: 
# 
# auditctl -l | egrep '(sethostname|setdomainname|/etc/issue|/etc/issue.net|/etc/hosts|/etc/sysconfig/network)'
# 
# If the system is configured to watch for network configuration changes, a line should be returned for each file specified (and "perm=wa" should be indicated for each). 
# If the system is not configured to audit changes of the network configuration, this is a finding.
# 
# Fix Text: Add the following to "/etc/audit/audit.rules", setting ARCH to either b32 or b64 as appropriate for your system: 
# 
# # audit_network_modifications
# -a exit,always -F arch=ARCH -S sethostname -S setdomainname -k audit_network_modifications
# -w /etc/issue -p wa -k audit_network_modifications
# -w /etc/issue.net -p wa -k audit_network_modifications
# -w /etc/hosts -p wa -k audit_network_modifications
# -w /etc/sysconfig/network -p wa -k audit_network_modifications   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

auditctl -l | egrep '(sethostname|setdomainname|/etc/issue|/etc/issue.net|/etc/hosts|/etc/sysconfig/network)'

echo "" >> /etc/audit/audit.rules
echo '# audit_network_modifications' >> /etc/audit/audit.rules
echo '-a exit,always -F arch=ARCH -S sethostname -S setdomainname -k audit_network_modifications' >> /etc/audit/audit.rules
echo '-w /etc/issue -p wa -k audit_network_modifications' >> /etc/audit/audit.rules
echo '-w /etc/issue.net -p wa -k audit_network_modifications' >> /etc/audit/audit.rules
echo '-w /etc/hosts -p wa -k audit_network_modifications' >> /etc/audit/audit.rules
echo '-w /etc/sysconfig/network -p wa -k audit_network_modifications' >> /etc/audit/audit.rules

