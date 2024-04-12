###################################################
# 
# Group ID (Vulid):  V-38629
# Group Title:  SRG-OS-000029
# Rule ID:  SV-50430r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000257
# Rule Title: The graphical desktop environment must set the idle timeout to no more than 15 minutes.
# 
# Vulnerability Discussion:  Setting the idle delay controls when the screensaver will start, and can be combined with screen locking to prevent access from passersby.
# 
# Check Content:  
# To check the current idle time-out value, run the following command: 
# 
# $ gconftool-2 -g /apps/gnome-screensaver/idle_delay
# 
# If properly configured, the output should be "15". 
# If it is not, this is a finding.
# 
# Fix Text: Run the following command to set the idle time-out value for inactivity in the GNOME desktop to 15 minutes: 
# 
# # gconftool-2 \
# --direct \
# --config-source xml:readwrite:/etc/gconf/gconf.xml.mandatory \
# --type int \
# --set /apps/gnome-screensaver/idle_delay 15   
# 
# CCI: CCI-000057
# 
###################################################

#!/bin/bash

gconftool-2 -g /apps/gnome-screensaver/idle_delay