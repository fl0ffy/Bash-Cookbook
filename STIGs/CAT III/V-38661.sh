###################################################
# 
# Group ID (Vulid):  V-38661
# Group Title:  SRG-OS-000185
# Rule ID:  SV-50462r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000276
# Rule Title: The operating system must protect the confidentiality and integrity of data at rest. 
# 
# Vulnerability Discussion:  The risk of a system's physical compromise, particularly mobile systems such as laptops, places its data at risk of compromise. Encrypting this data mitigates the risk of its loss if the system is lost.
# 
# Check Content:  
# Determine if encryption must be used to protect data on the system. 
# If encryption must be used and is not employed, this is a finding.
# 
# Fix Text: Red Hat Enterprise Linux 6 natively supports partition encryption through the Linux Unified Key Setup-on-disk-format (LUKS) technology. The easiest way to encrypt a partition is during installation time. 
# 
# For manual installations, select the "Encrypt" checkbox during partition creation to encrypt the partition. When this option is selected the system will prompt for a passphrase to use in decrypting the partition. The passphrase will subsequently need to be entered manually every time the system boots. 
# 
# For automated/unattended installations, it is possible to use Kickstart by adding the "--encrypted" and "--passphrase=" options to the definition of each partition to be encrypted. For example, the following line would encrypt the root partition: 
# 
# part / --fstype=ext3 --size=100 --onpart=hda1 --encrypted --passphrase=[PASSPHRASE]
# 
# Any [PASSPHRASE] is stored in the Kickstart in plaintext, and the Kickstart must then be protected accordingly. Omitting the "--passphrase=" option from the partition definition will cause the installer to pause and interactively ask for the passphrase during installation. 
# 
# Detailed information on encrypting partitions using LUKS can be found on the Red Had Documentation web site:
# https://docs.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/6/html/Security_Guide/sect-Security_Guide-LUKS_Disk_Encryption.html   
# 
# CCI: CCI-001199
# 
###################################################

#!/bin/bash


