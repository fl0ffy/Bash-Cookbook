###################################################
# 
# Group ID (Vulid):  V-38677
# Group Title:  SRG-OS-000104
# Rule ID:  SV-50478r1_rule
# Severity: CAT I
# Rule Version (STIG-ID):  RHEL-06-000309
# Rule Title: The NFS server must not have the insecure file locking option enabled.
# 
# Vulnerability Discussion:  Allowing insecure file locking could allow for sensitive data to be viewed or edited by an unauthorized user.
# 
# Check Content:  
# To verify insecure file locking has been disabled, run the following command: 
# 
# # grep insecure_locks /etc/exports
# 
# If there is output, this is a finding.
# 
# Fix Text: By default the NFS server requires secure file-lock requests, which require credentials from the client in order to lock a file. Most NFS clients send credentials with file lock requests, however, there are a few clients that do not send credentials when requesting a file-lock, allowing the client to only be able to lock world-readable files. To get around this, the "insecure_locks" option can be used so these clients can access the desired export. This poses a security risk by potentially allowing the client access to data for which it does not have authorization. Remove any instances of the "insecure_locks" option from the file "/etc/exports".   
# 
# CCI: CCI-000764
# 
###################################################

#!/bin/bash

grep insecure_locks /etc/exports