###################################################
# 
# Group ID (Vulid):  V-38630
# Group Title:  SRG-OS-000029
# Rule ID:  SV-50431r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000258
# Rule Title: The graphical desktop environment must automatically lock after 15 minutes of inactivity and the system must require user to re-authenticate to unlock the environment.
# 
# Vulnerability Discussion:  Enabling idle activation of the screen saver ensures the screensaver will be activated after the idle delay. Applications requiring continuous, real-time screen display (such as network management products) require the login session does not have administrator rights and the display station is located in a controlled-access area.
# 
# Check Content:  
# To check the screensaver mandatory use status, run the following command: 
# 
# $ gconftool-2 -g /apps/gnome-screensaver/idle_activation_enabled
# 
# If properly configured, the output should be "true". 
# If it is not, this is a finding.
# 
# Fix Text: Run the following command to activate the screensaver in the GNOME desktop after a period of inactivity: 
# 
# # gconftool-2 --direct \
# --config-source xml:readwrite:/etc/gconf/gconf.xml.mandatory \
# --type bool \
# --set /apps/gnome-screensaver/idle_activation_enabled true   
# 
# CCI: CCI-000057
# 
###################################################

#!/bin/bash

gconftool-2 -g /apps/gnome-screensaver/idle_activation_enabled