###################################################
# 
# Group ID (Vulid):  V-38593
# Group Title:  SRG-OS-000228
# Rule ID:  SV-50394r1_rule
# Severity: CAT II
# Rule Version (STIG-ID):  RHEL-06-000073
# Rule Title: The Department of Defense (DoD) login banner must be displayed immediately prior to, or as part of, console login prompts.
# 
# Vulnerability Discussion:  An appropriate warning message reinforces policy awareness during the logon process and facilitates possible legal action against attackers.
# 
# Check Content:  
# To check if the system login banner is compliant, run the following command: 
# 
# $ cat /etc/issue
# 
# If it does not display the required banner, this is a finding.
# 
# Fix Text: To configure the system login banner: 
# 
# Edit "/etc/issue". Replace the default text with a message compliant with the local site policy or a legal disclaimer. The DoD required text is either: 
# 
# "You are accessing a U.S. Government (USG) Information System (IS) that is provided for USG-authorized use only. By using this IS (which includes any device attached to this IS), you consent to the following conditions: 
# -The USG routinely intercepts and monitors communications on this IS for purposes including, but not limited to, penetration testing, COMSEC monitoring, network operations and defense, personnel misconduct (PM), law enforcement (LE), and counterintelligence (CI) investigations. 
# -At any time, the USG may inspect and seize data stored on this IS. 
# -Communications using, or data stored on, this IS are not private, are subject to routine monitoring, interception, and search, and may be disclosed or used for any USG-authorized purpose. 
# -This IS includes security measures (e.g., authentication and access controls) to protect USG interests -- not for your personal benefit or privacy. 
# -Notwithstanding the above, using this IS does not constitute consent to PM, LE or CI investigative searching or monitoring of the content of privileged communications, or work product, related to personal representation or services by attorneys, psychotherapists, or clergy, and their assistants. Such communications and work product are private and confidential. See User Agreement for details." 
# 
# OR: 
# 
# "I've read & consent to terms in IS user agreem't."   
# 
# CCI: CCI-001384
# 
# CCI: CCI-001385
# 
# CCI: CCI-001386
# 
# CCI: CCI-001387
# 
# CCI: CCI-001388
# 
###################################################

#!/bin/bash

cat /etc/issue

