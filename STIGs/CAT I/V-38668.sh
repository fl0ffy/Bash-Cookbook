# ###################################################
# 
# Group ID (Vulid):  V-38668
# Group Title:  SRG-OS-999999
# Rule ID:  SV-50469r1_rule
# Severity: CAT I
# Rule Version (STIG-ID):  RHEL-06-000286
# Rule Title: The x86 Ctrl-Alt-Delete key sequence must be disabled.
# 
# Vulnerability Discussion:  A locally logged-in user who presses Ctrl-Alt-Delete, when at the console, can reboot the system. If accidentally pressed, as could happen in the case of mixed OS environment, this can create the risk of short-term loss of availability of systems due to unintentional reboot. In the GNOME graphical environment, risk of unintentional reboot from the Ctrl-Alt-Delete sequence is reduced because the user will be prompted before any action is taken.
# 
# Check Content:  
# Determine what actions the system takes when the Ctrl-Alt-Delete key sequence is pressed, run the following command:
# 
# # cat `grep -l control-alt-delete /etc/init/*`
# 
# Examine all lines following the "start on control-alt-delete" line in any files found. By default, the system uses "/etc/init/control-alt-delete.conf" to reboot the system with the following command when the Ctrl-Alt-Delete key sequence is pressed: 
# 
# exec /sbin/shutdown -r now "Control-Alt-Delete pressed"
# 
# If the system is configured to run any shutdown command, this is a finding.
# 
# Fix Text: Configure the system to log a message instead of rebooting the system by altering the "shutdown" line in "/etc/init/control-alt-delete.conf" to read as follows: `
# 
# exec /usr/bin/logger -p security.info "Ctrl-Alt-Delete pressed"   
# 
# CCI: CCI-000366
# 
###################################################

#!/bin/bash

#cat `grep -l control-alt-delete /etc/init/*`
cat /etc/init/* | grep shutdown | grep Control

sed -i 's/exec \/sbin\/shutdown -r now "Control-Alt-Delete pressed"/exec \/usr\b/in\/logger -p security.info "Ctrl-Alt-Delete pressed"/' /etc/init/control-alt-delete.conf