###################################################
# 
# Group ID (Vulid):  V-38474
# Group Title:  SRG-OS-000030
# Rule ID:  SV-50274r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000508
# Rule Title: The system must allow locking of graphical desktop sessions.
# 
# Vulnerability Discussion:  The ability to lock graphical desktop sessions manually allows users to easily secure their accounts should they need to depart from their workstations temporarily.
# 
# Check Content:  
# Verify the keybindings for the Gnome screensaver:
# 
# # gconftool-2 --direct --config-source xml:readwrite:/etc/gconf/gconf.xml.mandatory --get /apps/gnome_settings_daemon/keybindings/screensaver
# 
# If no output is visible, this is a finding.
# 
# Fix Text: Run the following command to set the Gnome desktop keybinding for locking the screen:
# 
# # gconftool-2
# --direct \
# --config-source xml:readwrite:/etc/gconf/gconf.xml.mandatory \
# --type string \
# --set /apps/gnome_settings_daemon/keybindings/screensaver "<Control><Alt>l"
# 
# Another keyboard sequence may be substituted for "<Control><Alt>l", which is the default for the Gnome desktop.   
# 
# CCI: CCI-000058
# 
###################################################

#!/bin/bash

