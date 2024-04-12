###################################################
# 
# Group ID (Vulid):  V-38638
# Group Title:  SRG-OS-000029
# Rule ID:  SV-50439r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000259
# Rule Title: The graphical desktop environment must have automatic lock enabled.
# 
# Vulnerability Discussion:  Enabling the activation of the screen lock after an idle period ensures password entry will be required in order to access the system, preventing access by passersby.
# 
# Check Content:  
# To check the status of the idle screen lock activation, run the following command: 
# 
# $ gconftool-2 -g /apps/gnome-screensaver/lock_enabled
# 
# If properly configured, the output should be "true". 
# If it is not, this is a finding.
# 
# Fix Text: Run the following command to activate locking of the screensaver in the GNOME desktop when it is activated: 
# 
# # gconftool-2 --direct \
# --config-source xml:readwrite:/etc/gconf/gconf.xml.mandatory \
# --type bool \
# --set /apps/gnome-screensaver/lock_enabled true   
# 
# CCI: CCI-000057
# 
###################################################

#!/bin/bash

gconftool-2 -g /apps/gnome-screensaver/lock_enabled