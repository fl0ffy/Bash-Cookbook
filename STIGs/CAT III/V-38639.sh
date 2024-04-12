###################################################
# 
# Group ID (Vulid):  V-38639
# Group Title:  SRG-OS-000031
# Rule ID:  SV-50440r1_rule
# Severity: CAT III
# Rule Version (STIG-ID):  RHEL-06-000260
# Rule Title: The system must display a publicly-viewable pattern during a graphical desktop environment session lock.
# 
# Vulnerability Discussion:  Setting the screensaver mode to blank-only conceals the contents of the display from passersby.
# 
# Check Content:  
# To ensure the screensaver is configured to be blank, run the following command: 
# 
# $ gconftool-2 -g /apps/gnome-screensaver/mode
# 
# If properly configured, the output should be "blank-only" 
# If it is not, this is a finding.
# 
# Fix Text: Run the following command to set the screensaver mode in the GNOME desktop to a blank screen: 
# 
# # gconftool-2
# --direct \
# --config-source xml:readwrite:/etc/gconf/gconf.xml.mandatory \
# --type string \
# --set /apps/gnome-screensaver/mode blank-only   
# 
# CCI: CCI-000060
# 
###################################################

#!/bin/bash

gconftool-2 -g /apps/gnome-screensaver/mode