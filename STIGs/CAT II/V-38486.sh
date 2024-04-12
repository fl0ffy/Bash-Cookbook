###################################################
# 
# Group ID (Vulid):  V-38486
# Group Title:  SRG-OS-000100
# Rule ID:  SV-50287r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000505
# Rule Title: The operating system must conduct backups of system-level information contained in the information system per organization defined frequency to conduct backups that are consistent with recovery time and recovery point objectives.
# 
# Vulnerability Discussion:  Operating system backup is a critical step in maintaining data assurance and availability. System-level information includes system-state information, operating system and application software, and licenses. Backups must be consistent with organizational recovery time and recovery point objectives.
# 
# Check Content:  
# Ask an administrator if a process exists to back up OS data from the system, including configuration data. 
# 
# If such a process does not exist, this is a finding.
# 
# Fix Text: Procedures to back up OS data from the system must be established and executed. The Red Hat operating system provides utilities for automating such a process. Commercial and open-source products are also available.
# 
# Implement a process whereby OS data is backed up from the system in accordance with local policies.   
# 
# CCI: CCI-000537
# 
###################################################

#!/bin/bash
