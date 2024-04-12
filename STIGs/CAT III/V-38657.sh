###################################################
# 
# Group ID (Vulid):  V-38657
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50458r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000273
# Rule Title: The system must use SMB client signing for connecting to samba servers using mount.cifs.
# 
# Vulnerability Discussion:  Packet signing can prevent man-in-the-middle attacks which modify SMB packets in transit.
# 
# Check Content:  
# To verify that Samba clients using mount.cifs must use packet signing, run the following command: 
# 
# # grep sec /etc/fstab
# 
# The output should show either "krb5i" or "ntlmv2i" in use. 
# If it does not, this is a finding.
# 
# Fix Text: Require packet signing of clients who mount Samba shares using the "mount.cifs" program (e.g., those who specify shares in "/etc/fstab"). To do so, ensure signing options (either "sec=krb5i" or "sec=ntlmv2i") are used. 
# 
# See the "mount.cifs(8)" man page for more information. A Samba client should only communicate with servers who can support SMB packet signing.   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

grep sec /etc/fstab