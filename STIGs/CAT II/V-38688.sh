###################################################
# 
# Group ID (Vulid):  V-38688
# Group Title:  SRG-OS-000024
# Rule ID:  SV-50489r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000324
# Rule Title: A login banner must be displayed immediately prior to, or as part of, graphical desktop environment login prompts.
# 
# Vulnerability Discussion:  An appropriate warning message reinforces policy awareness during the logon process and facilitates possible legal action against attackers.
# 
# Check Content:  
# To ensure a login warning banner is enabled, run the following: 
# 
# $ gconftool-2 -g /apps/gdm/simple-greeter/banner_message_enable
# 
# Search for the "banner_message_enable" schema. If properly configured, the "default" value should be "true". 
# If it is not, this is a finding.
# 
# Fix Text: To enable displaying a login warning banner in the GNOME Display Manager's login screen, run the following command: 
# 
# sudo -u gdm gconftool-2 \
# --type bool \
# --set /apps/gdm/simple-greeter/banner_message_enable true
# 
# To display a banner, this setting must be enabled and then banner text must also be set.   
# 
# CCI: CCI-000050
# 
###################################################

#!/bin/bash

gconftool-2 -g /apps/gdm/simple-greeter/banner_message_enable