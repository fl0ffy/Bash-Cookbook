###################################################
# 
# Group ID (Vulid):  V-38656
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50457r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000272
# Rule Title: The system must use SMB client signing for connecting to samba servers using smbclient.
# 
# Vulnerability Discussion:  Packet signing can prevent man-in-the-middle attacks which modify SMB packets in transit.
# 
# Check Content:  
# To verify that Samba clients running smbclient must use packet signing, run the following command: 
# 
# # grep signing /etc/samba/smb.conf
# 
# The output should show: 
# 
# client signing = mandatory
# 
# If it is not, this is a finding.
# 
# Fix Text: To require samba clients running "smbclient" to use packet signing, add the following to the "[global]" section of the Samba configuration file in "/etc/samba/smb.conf": 
# 
# client signing = mandatory
# 
# Requiring samba clients such as "smbclient" to use packet signing ensures they can only communicate with servers that support packet signing.   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

grep signing /etc/samba/smb.conf