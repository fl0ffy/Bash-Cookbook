#!/bin/bash

############################################################################
#
# Author:		Johnathan Bernat
# Date:			22 Jan 2014
# Description:		RHEL 6.x STIG searching for CAT I findings.
# Input parameters:	none
# Sample usage:		./script
#
#############################################################################

V=

#################################################################
#	 							#
#	 		CAT I					#
#	 							#
#################################################################

#V-38462 (CAT I) The RPM package management tool must cryptographically verify the authenticity of all software packages during installation.
V='V-38462 CAT-I' ; if [[ -n $(grep nosignature /etc/rpmrc /usr/lib/rpm/rpmrc /usr/lib/rpm/redhat/rpmrc ~root/.rpmrc) ]]; then echo "$V Finding" ; else echo "$V No finding" ; fi

#V-38476 (CAT I) Vendor-provided cryptographic certificates must be installed to verify the integrity of system software. (gpg(Red Hat, Inc. (release key #) <security@redhat.com>))
V='V-38476 CAT-I' ; if [[ -n $(rpm -q --queryformat "%{SUMMARY}\n" gpg-pubkey | grep release) ]]; then echo "$V No finding" ; else echo "$V Finding" ; fi

#V-38491 (CAT I) The existence of the file "/etc/hosts.equiv" or a file named ".rhosts" inside a user home directory indicates the presence of an Rsh trust relationship.
V='V-38491 CAT-I' ; if [[ -n $(find /home -name .rhosts) ]] || [[ -n $(find /etc -name hosts.equiv) ]] ; then echo "$V Finding" ; else echo "$V No finding" ; fi

#V-38497 (CAT I) The system must not have accounts configured with blank or null passwords.
V='V-38497 CAT-I' ; if [[ -n $(grep nullok /etc/pam.d/system-auth /etc/pam.d/system-auth-ac) ]]; then echo "$V Finding" ; else echo "$V No finding" ; fi

#V-38587 (CAT I) The telnet-server package must not be installed.
V='V-38587 CAT-I' ; if [[ -n $(rpm -q telnet-server | grep "not installed") ]]; then echo "$V No finding" ; else echo "$V Finding" ; fi

#V-38589 (CAT I) The telnet daemon must not be running.
V='V-38589 CAT-I' ; if [[ -n $(service telnet status | grep running) ]]; then echo "$V Finding" ; else echo "$V No finding" ; fi

#V-38591 (CAT I) The rsh-server package must not be installed.
V='V-38591 CAT-I' ; if [[ -n $(rpm -q rsh-server | grep "not installed") ]]; then echo "$V No finding" ; else echo "$V Finding" ; fi

#V-38594 (CAT I) The rshd service must not be running.
V='V-38594 CAT-I' ; if [[ -n $(chkconfig --list | grep rshd | grep on) ]]; then echo "$V Finding" ; else echo "$V No finding" ; fi

#V-38598 (CAT I) The rexecd service must not be running.
V='V-38598 CAT-I' ; if [[ -n $(service rexecd status | grep running) ]]; then echo "$V Finding" ; else echo "$V No finding" ; fi

#V-38602 (CAT I) The rlogind service must not be running.
V='V-38602 CAT-I' ; if [[ -n $(service rlogind status | grep running) ]]; then echo "$V Finding" ; else echo "$V No finding" ; fi

#V-38607 (CAT I) The SSH daemon must be configured to use only the SSHv2 protocol.
V='V-38607 CAT-I' ; if [[ $(grep Protocol /etc/ssh/sshd_config) == "Protocol 2" ]]; then echo "$V No finding" ; else echo "$V Finding" ; fi

#V-38614 (CAT I) The SSH daemon must not allow authentication using an empty password.
V='V-38614 CAT-I' ; if [[ -n $(grep -i PermitEmptyPasswords /etc/ssh/sshd_config | grep -v "^#") ]]; then echo "$V Finding" ; else echo "$V No finding" ; fi

#V-38653 (CAT I) The snmpd service must not use a default password.
V='V-38653 CAT-I' ; if [[ -n $(grep -v "^#" /etc/snmp/snmpd.conf| grep public) ]]; then echo "$V Finding" ; else echo "$V No finding" ; fi

#V-38666 (CAT I) The system must use and update a DoD-approved virus scan program.
#Software dependent
v='V-38666\tCAT-I' ; echo "$V Finding"

#V-38668 (CAT I) The x86 Ctrl-Alt-Delete key sequence must be disabled.
V='V-38668 CAT-I' ; if [[ -n $(cat `grep -l control-alt-delete /etc/init/*` | grep -v "^#" | grep shutdown) ]]; then echo "$V Finding" ; else echo "$V No finding" ; fi

#V-38677 (CAT I) The NFS server must not have the insecure file locking option enabled.
V='V-38677 CAT-I' ; if [[ -n $(grep insecure_locks /etc/exports) ]]; then echo "$V Finding" ; else echo "$V No finding" ; fi

#V-38701 (CAT I) The TFTP daemon must operate in secure mode which provides access only to a single directory on the host file system.
V='V-38701 CAT-I' ; if [[ -n $(grep "server_args" /etc/xinetd.d/tftp | grep -v "^#" | grep "\-s") ]]; then echo "$V No finding" ; else echo "$V Finding" ; fi











