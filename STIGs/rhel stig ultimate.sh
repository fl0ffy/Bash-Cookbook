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
V='V-38666 CAT-I' ; echo "$V Manual Review Required"

#V-38668 (CAT I) The x86 Ctrl-Alt-Delete key sequence must be disabled.
V='V-38668 CAT-I' ; if [[ -n $(cat `grep -l control-alt-delete /etc/init/*` | grep -v "^#" | grep shutdown) ]]; then echo "$V Finding" ; else echo "$V No finding" ; fi

#V-38677 (CAT I) The NFS server must not have the insecure file locking option enabled.
V='V-38677 CAT-I' ; if [[ -n $(grep insecure_locks /etc/exports) ]]; then echo "$V Finding" ; else echo "$V No finding" ; fi

#V-38701 (CAT I) The TFTP daemon must operate in secure mode which provides access only to a single directory on the host file system.
V='V-38701 CAT-I' ; if [[ -n $(grep "server_args" /etc/xinetd.d/tftp | grep -v "^#" | grep "\-s") ]]; then echo "$V No finding" ; else echo "$V Finding" ; fi

#################################################################
#	 							#
#	 		CAT II					#
#	 							#
#################################################################

#V-38439 (CAT II) The system must provide automated support for account management functions.
V='V-38439 CAT-II' ; echo "$V Manual Review Required (Last updated $(rpm -qa -last | head -1 | awk '{print $3$4$5}'))"

#V-38443 (CAT II) The /etc/gshadow file must be owned by root.
V='V-38443 CAT-II' ; if [[ $(ls -l /etc/gshadow | cut -d' ' -f3) == "root" ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38444 (CAT II) The systems local IPv6 firewall must implement a deny-all, allow-by-exception policy for inbound packets.
V='V-38444 CAT-II' ; if [[ -n $(grep ":INPUT" /etc/sysconfig/ip6tables | grep DROP) ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38445 (CAT II) Audit log files must be group-owned by root.
V='V-38445 CAT-II' ; if [[ -n $(grep "^log_file" /etc/audit/auditd.conf|sed s/^[^\/]*//|xargs stat -c %G:%n | grep root) ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38446 (CAT II) The mail system must forward all mail for root to one or more system administrators.
V='V-38446 CAT-II' ; if [[ -n $( postmap -q root $(postconf alias_maps | cut -d: -f2)) ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38448 (CAT II) The /etc/gshadow file must be group-owned by root.
V='V-38448 CAT-II' ; if [[ $(ls -l /etc/gshadow | cut -d' ' -f4) == "root" ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38449 (CAT II) The /etc/gshadow file must have mode 0000.
V='V-38449 CAT-II' ; if [[ $(ls -l /etc/gshadow | cut -d' ' -f1) == "----------." ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38450 (CAT II) The /etc/passwd file must be owned by root.
V='V-38450 CAT-II' ; if [[ $(ls -l /etc/passwd | cut -d' ' -f3) == "root" ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38451 (CAT II) The /etc/passwd file must be group-owned by root.
V='V-38451 CAT-II' ; if [[ $(ls -l /etc/passwd | cut -d' ' -f4) == "root" ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38457 (CAT II) The /etc/passwd file must have mode 0644 or less permissive.
V='V-38457 CAT-II' ; if [[ $(ls -l /etc/passwd | cut -d' ' -f1) == "-rw-r--r--." ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38458 (CAT II) The /etc/group file must be owned by root.
V='V-38458 CAT-II' ; if [[ $(ls -l /etc/group | cut -d' ' -f3) == "root" ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38459 (CAT II) The /etc/group file must be group-owned by root.
V='V-38459 CAT-II' ; if [[ $(ls -l /etc/group | cut -d' ' -f4) == "root" ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38461 (CAT II) The /etc/group file must have mode 0644 or less permissive.
V='V-38461 CAT-II' ; if [[ $(ls -l /etc/group | cut -d' ' -f1) == "-rw-r--r--." ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38464 (CAT II) The audit system must take appropriate action when there are disk errors on the audit storage volume.
V='V-38464 CAT-II' ; if [[ ignore != $(grep disk_error_action /etc/audit/auditd.conf | cut -d= -f2 | sed 's/[[:space:]]//g' | awk '{print tolower($0)}') ]] && [[ suspend != $(grep disk_error_action /etc/audit/auditd.conf | cut -d= -f2 | sed 's/[[:space:]]//g' | awk '{print tolower($0)}') ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38465 (CAT II) Library files must have mode 0755 or less permissive.
V='V-38465 CAT-II' ; if [[ -n $(array=( /lib /lib64 /usr/lib /usr/lib64 ) ; for i in $(eval echo \${array[@]}) ; do find -L $i -perm /022; done) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38466 (CAT II) Library files must be owned by root.
V='V-38466 CAT-II' ; if [[ -n $(array=( /lib /lib64 /usr/lib /usr/lib64 ) ; for i in $(eval echo \${array[@]}) ; do find -L $i  \! -user root; done) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38468 (CAT II) The audit system must take appropriate action when the audit storage volume is full.
V='V-38468 CAT-II' ; if [[ ignore != $(grep disk_full_action /etc/audit/auditd.conf | cut -d= -f2 | sed 's/[[:space:]]//g' | awk '{print tolower($0)}') ]] && [[ suspend != $(grep disk_full_action /etc/audit/auditd.conf | cut -d= -f2 | sed 's/[[:space:]]//g' | awk '{print tolower($0)}') ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38469 (CAT II) All system command files must have mode 0755 or less permissive.
V='V-38469 CAT-II' ; if [[ -n $(a=( /bin /usr/bin /usr/local/bin /sbin /usr/sbin /usr/local/sbin ) ; for i in $(eval echo \${a[@]}) ; do find -L $i -perm /022; done) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38470 (CAT II) The audit system must alert designated staff members when the audit storage volume approaches capacity.
V='V-38470 CAT-II' ; if [[ email == $(grep space_left_action /etc/audit/auditd.conf | cut -d= -f2 | sed 's/[[:space:]]//g' | awk '{print tolower($0)}' | grep email) ]] ; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38472 (CAT II) All system command files must be owned by root.
V='V-38472 CAT-II' ; if [[ -n $(array=( /bin /usr/bin /usr/local/bin /sbin /usr/sbin /usr/local/sbin ) ; for i in $(eval echo \${array[@]}) ; do find -L $i  \! -user root; done) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38475 (CAT II) The system must require passwords to contain a minimum of 14 characters.
V='V-38475 CAT-II' ; if [[ 14 -le $(grep PASS_MIN_LEN /etc/login.defs | grep -v ^# | awk '{print$2}') ]]; then echo "$V No finding" ; else echo "$V Finding" ; fi

#V-38477 (CAT II) Users must not be able to change passwords more than once every 24 hours.
V='V-38477 CAT-II' ; if [[ 1 -le $(grep PASS_MIN_DAYS /etc/login.defs | grep -v ^# | awk '{print$2}') ]]; then echo "$V No finding" ; else echo "$V Finding" ; fi

#V-38479 (CAT II) User passwords must be changed at least every 60 days.
V='V-38479 CAT-II' ; if [[ 60 -ge $(grep PASS_MAX_DAYS /etc/login.defs | grep -v ^# | awk '{print$2}') ]]; then echo "$V No finding" ; else echo "$V Finding" ; fi

#V-38481 (CAT II) System security patches and updates must be installed and up-to-date. (rpm -qa -last (compare dates))
V='V-38481 CAT-III' ; echo "$V Manual Review Required (Last updated $(rpm -qa -last | head -1 | awk '{print $3$4$5}'))"

#V-38483 (CAT II) The system package management tool must cryptographically verify the authenticity of system software packages during installation.
V='V-38483 CAT-II' ; for n in $(grep -r gpgcheck /etc/yum* | cut -d: -f1); do echo $n ; if [[ $(eval grep gpgcheck $n | cut -d: -f1 | grep -v '^#' | sed 's/ //g' | cut -d= -f2 | uniq) == 1 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi ; done

#V-38484 (CAT II) The operating system, upon successful logon, must display to the user the date and time of the last logon or access via ssh.
V='V-38484 CAT-II' ; if [[ yes == $(grep -i PrintLastLog /etc/ssh/sshd_config | grep -v ^# | awk '{print $2}') ]]; then echo "$V No finding" ; else echo "$V Finding" ; fi

#V-38485 (CAT II) The operating system, upon successful logon, must display to the user the date and time of the last logon or access via a local console or tty.
V='V-38485 CAT-II' ; if  [[ -e /etc/hushlogins ]] && [[ -e $(for i in $(ls /home); do ls /home/$i/.hushlogin; done) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38486 (CAT II) The operating system must conduct backups of system-level information contained in the information system per organization defined frequency to conduct backups that are consistent with recovery time and recovery point objectives.
V='V-38486 CAT-II' ; echo "$V Manual Review Required"

#V-38488 (CAT II) The operating system must conduct backups of user-level information contained in the operating system per organization defined frequency to conduct backups consistent with recovery time and recovery point objectives.
V='V-38488 CAT-II' ; echo "$V Manual Review Required"

#V-38489 (CAT II) A file integrity tool must be installed.
V='V-38489 CAT-II' ; if [[ -n $(rpm -q aide | grep "not installed") ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38490 (CAT II) The operating system must enforce requirements for the connection of mobile devices to operating systems.
V='V-38490 CAT-II' ; if  [[ -n $(grep -r usb-storage /etc/modprobe*) ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38492 (CAT II) The system must prevent the root account from logging in from virtual consoles.
V='V-38492 CAT-II' ; if  [[ -n $(grep '^vc/[0-9]' /etc/securetty) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38493 (CAT II) Audit log directories must have mode 0755 or less permissive.
V='V-38493 CAT-II' ; if  [[ 755 -ge $(grep "^log_file" /etc/audit/auditd.conf|sed 's/^[^/]*//; s/[^/]*$//'|xargs stat -c %a:%n | cut -d: -f1) ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38495 (CAT II) Audit log files must be owned by root.
V='V-38495 CAT-II' ; if  [[ root == $(grep "^log_file" /etc/audit/auditd.conf|sed s/^[^\/]*//|xargs stat -c %U:%n | cut -d: -f1) ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38496 (CAT II) Default system accounts, other than root, must be locked.
V='V-38496 CAT-II' ; if [[ -n $(for n in $(l=$(grep "^UID_MIN" /etc/login.defs | awk '{print $2}') ; l1=$(grep "^UID_MAX" /etc/login.defs | awk '{print $2}'); awk -F':' -v "min=${l}" -v "max=${l1}" '{ if ( !($3 >= min && $3 <= max  && $7 != "/sbin/nologin")) print $0 }' "/etc/passwd" | awk -F: '{print $1}'); do grep $n /etc/shadow | awk -F: '{print $2}' | grep -v '\!\!' | grep -v '\!\*' | sed 's/[[:space:]]//g'; done) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38498 (CAT II) Audit log files must have mode 0640 or less permissive.
V='V-38498 CAT-II' ; if  [[ 640 -ge $(grep "^log_file" /etc/audit/auditd.conf|sed s/^[^\/]*//|xargs stat -c %a:%n | cut -d: -f1) ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38499 (CAT II) The /etc/passwd file must not contain password hashes.
V='V-38499 CAT-II' ; if  [[ -n $(awk -F: '($2 != "x") {print}' /etc/passwd) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38500 (CAT II) The root account must be the only account having a UID of 0.
V='V-38500 CAT-II' ; if  [[ root != $(awk -F: '($3 == "0") {print}' /etc/passwd | awk -F: '{print $1}') ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38501 (CAT II) The system must disable accounts after excessive login failures within a 15-minute interval.
V='V-38501 CAT-II' ; if  [[ 900 -le $(grep pam_faillock /etc/pam.d/system-auth-ac | sed 's/[[:space:]]/\n/g' | grep fail_interval | awk -F= '{print $2}') ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38502 (CAT II) The /etc/shadow file must be owned by root.
V='V-38502 CAT-II' ; if [[ $(ls -l /etc/shadow | cut -d' ' -f3) == "root" ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38503 (CAT II) The /etc/shadow file must be group-owned by root.
V='V-38503 CAT-II' ; if [[ $(ls -l /etc/shadow | cut -d' ' -f4) == "root" ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38504 (CAT II) The /etc/shadow file must have mode 0000.
V='V-38504 CAT-II' ; if [[ $(ls -l /etc/shadow | cut -d' ' -f1) == "----------." ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38511 (CAT II) IP forwarding for IPv4 must not be enabled, unless the system is a router.(0)
V='V-38511 CAT-II' ; if [[ $(sysctl net.ipv4.ip_forward | cut -d= -f2 | sed 's/^ //') == 0 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38512 (CAT II) The operating system must prevent public IPv4 access into an organizations internal networks, except as appropriately mediated by managed interfaces employing boundary protection devices.
V='V-38512 CAT-II' ; if [[ -n $(service iptables status | grep "not running") ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38513 (CAT II) The systems local IPv4 firewall must implement a deny-all, allow-by-exception policy for inbound packets.
V='V-38513 CAT-II' ; if [[ -n $(grep ":INPUT" /etc/sysconfig/iptables | grep DROP) ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38514 (CAT II) The Datagram Congestion Control Protocol (DCCP) must be disabled unless required.
V='V-38514 CAT-II' ; if [[ -z $(grep -r dccp /etc/modprobe*) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38515 (CAT II) The Stream Control Transmission Protocol (SCTP) must be disabled unless required.
V='V-38515 CAT-II' ; if [[ -z $(grep -r sctp /etc/modprobe*) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38517 (CAT II) The Transparent Inter-Process Communication (TIPC) protocol must be disabled unless required.
V='V-38517 CAT-II' ; if [[ -z $(grep -r tipc /etc/modprobe*) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38518 (CAT II) All rsyslog-generated log files must be owned by root.
V='V-38518 CAT-II' ; if [[ -n $(for n in $(cat /etc/rsyslog.conf | grep -v '^#' | grep var | grep -o '[^\/]*$' | sed -e 's/^/\/var\/log\//g'); do ls -l $n | awk '{print $3}' | grep -v root; done) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi 

#V-38519 (CAT II) All rsyslog-generated log files must be group-owned by root.
V='V-38519 CAT-II' ; if [[ -n $(for n in $(cat /etc/rsyslog.conf | grep -v '^#' | grep var | grep -o '[^\/]*$' | sed -e 's/^/\/var\/log\//g'); do ls -l $n | awk '{print $4}' | grep -v root; done) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi 

#V-38520 (CAT II) The operating system must back up audit records on an organization defined frequency onto a different system or media than the system being audited.
V='V-38520 CAT-II' ; if [[ -z $(grep '\*\.\*' /etc/rsyslog.conf | grep -v "^#") ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi 

#V-38521 (CAT II) The operating system must support the requirement to centrally manage the content of audit records generated by organization defined information system components.
V='V-38521 CAT-II' ; if [[ -z $(grep '\*\.\*' /etc/rsyslog.conf | grep -v "^#") ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi 

#V-38523 (CAT II) The system must not accept IPv4 source-routed packets on any interface.(0)
V='V-38523 CAT-II' ; if [[ $(sysctl net.ipv4.conf.all.accept_source_route | cut -d= -f2 | sed 's/^ //') == 0 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38524 (CAT II) The system must not accept ICMPv4 redirect packets on any interface.(0)
V='V-38524 CAT-II' ; if [[ $(sysctl net.ipv4.conf.all.accept_redirects | cut -d= -f2 | sed 's/^ //') == 0 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38526 (CAT II) The system must not accept ICMPv4 secure redirect packets on any interface.(0)
V='V-38526 CAT-II' ; if [[ $(sysctl net.ipv4.conf.all.secure_redirects | cut -d= -f2 | sed 's/^ //') == 0 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38529 (CAT II) The system must not accept IPv4 source-routed packets by default.(0)
V='V-38529 CAT-II' ; if [[ $(sysctl net.ipv4.conf.default.accept_source_route | cut -d= -f2 | sed 's/^ //') == 0 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38532 (CAT II) The system must not accept ICMPv4 secure redirect packets by default.(0)
V='V-38532 CAT-II' ; if [[ $(sysctl net.ipv4.conf.default.secure_redirects | cut -d= -f2 | sed 's/^ //') == 0 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38539 (CAT II) The system must be configured to use TCP syncookies.(1)
V='V-38539 CAT-II' ; if [[ $(sysctl net.ipv4.tcp_syncookies | cut -d= -f2 | sed 's/^ //') == 1 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38542 (CAT II) The system must use a reverse-path filter for IPv4 network traffic when possible on all interfaces.(1)
V='V-38542 CAT-II' ; if [[ $(sysctl net.ipv4.conf.all.rp_filter | cut -d= -f2 | sed 's/^ //') == 1 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38544 (CAT II) The system must use a reverse-path filter for IPv4 network traffic when possible by default.(1)
V='V-38544 CAT-II' ; if [[ $(sysctl net.ipv4.conf.default.rp_filter | cut -d= -f2 | sed 's/^ //') == 1 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38546 (CAT II) The IPv6 protocol handler must not be bound to the network stack unless needed.
V='V-38546 CAT-II' ; if [[ -z $(grep -r ipv6 /etc/modprobe*) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38548 (CAT II) The system must ignore ICMPv6 redirects by default.(0)
V='V-38548 CAT-II' ; if [[ $(sysctl net.ipv6.conf.default.accept_redirects | cut -d= -f2 | sed 's/^ //') == 0 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38549 (CAT II) The system must employ a local IPv6 firewall.
V='V-38549 CAT-II' ; if [[ -n $(service ip6tables status | grep "not running") ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38551 (CAT II) The operating system must connect to external networks or information systems only through managed IPv6 interfaces consisting of boundary protection devices arranged in accordance with an organizational security architecture.
V='V-38551 CAT-II' ; if [[ -n $(service ip6tables status | grep "not running") ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38553 (CAT II) The operating system must prevent public IPv6 access into an organizations internal networks, except as appropriately mediated by managed interfaces employing boundary protection devices.
V='V-38553 CAT-II' ; if [[ -n $(service ip6tables status | grep "not running") ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38555 (CAT II) The system must employ a local IPv4 firewall.
V='V-38555 CAT-II' ; if [[ -n $(service iptables status | grep "not running") ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38560 (CAT II) The operating system must connect to external networks or information systems only through managed IPv4 interfaces consisting of boundary protection devices arranged in accordance with an organizational security architecture.
V='V-38560 CAT-II' ; if [[ -n $(service iptables status | grep "not running") ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38573 (CAT II) The system must disable accounts after three consecutive unsuccessful login attempts.
V='V-38573 CAT-II' ; if [[ 3 -eq $(grep pam_faillock /etc/pam.d/system-auth-ac | sed 's/[[:space:]]/\n/g' | grep ^deny | uniq | awk -F= '{print $2}') ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38574 (CAT II) The system must use a FIPS 140-2 approved cryptographic hashing algorithm for generating account password hashes (system-auth).
V='V-38574  CAT-II' ; if [[ -n $(grep sha512 /etc/pam.d/system-auth) ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38576 (CAT II) The system must use a FIPS 140-2 approved cryptographic hashing algorithm for generating account password hashes (login.defs).
V='V-38576 CAT-II' ; if [[ -n $(grep "ENCRYPT_METHOD SHA512" /etc/login.defs) ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38577 (CAT II) The system must use a FIPS 140-2 approved cryptographic hashing algorithm for generating account password hashes (libuser.conf).
V='V-38577 CAT-II' ; if [[ -n $(grep crypt_style /etc/libuser.conf | grep sha512) ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38579 (CAT II) The system boot loader configuration file(s) must be owned by root.
V='V-38579 CAT-II' ; if [[ $(ls -lL /etc/grub.conf | cut -d' ' -f3) == "root" ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38580 (CAT II) The audit system must be configured to audit the loading and unloading of dynamic kernel modules.
V='V-38580  CAT-II' ; if [[ -n $(auditctl -l | grep syscall | grep init_module) ]] && [[ -n $(auditctl -l | grep syscall | grep delete_module) ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38581 (CAT II) The system boot loader configuration file(s) must be group-owned by root.
V='V-38581 CAT-II' ; if [[ $(ls -lL /etc/grub.conf | cut -d' ' -f4) == "root" ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38582 (CAT II) The xinetd service must be disabled if no network services utilizing it are enabled. 
V='V-38582 CAT-II' ; if [[ -n $(service xinetd status | grep running) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38583 (CAT II) The system boot loader configuration file(s) must have mode 0600 or less permissive.
V='V-38583 CAT-II' ; if [[ $(ls -lL /etc/grub.conf | cut -d' ' -f1) == "-rw-------." ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38585 (CAT II) The system boot loader must require authentication.
V='V-38585 CAT-II' ; if [[ -n $(grep password /etc/grub.conf | grep encrypted | grep "\$6\$*") ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38586 (CAT II) The system must require authentication upon booting into single-user and maintenance modes.
V='V-38586 CAT-II' ; if [[ $(grep SINGLE /etc/sysconfig/init | awk -F= '{print $2}') != /sbin/sulogin ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38588 (CAT II) The system must not permit interactive boot.
V='V-38588 CAT-II' ; if [[ $(grep PROMPT /etc/sysconfig/init | awk -F= '{print $2}') != no ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38592 (CAT II) The system must require administrator action to unlock an account locked by excessive failed login attempts.
V='V-38592 CAT-II' ; if [[ $(grep pam_faillock /etc/pam.d/system-auth-ac | sed 's/[[:space:]]/\n/g' | grep unlock_time | awk -F= '{print $2}') -eq 604800 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38593 (CAT II) The Department of Defense (DoD) login banner must be displayed immediately prior to, or as part of, console login prompts.
V='V-38593 CAT-II' ; echo "$V Manual Review Required"

#V-38595 (CAT II) The system must be configured to require the use of a CAC, PIV compliant hardware token, or Alternate Logon Token (ALT) for authentication.
V='V-38595 CAT-II' ; echo "$V Manual Review Required"

#V-38596 (CAT II) The system must implement virtual address space randomization. (recommended 2)
V='V-38596 CAT-II' ; if [[ $(sysctl kernel.randomize_va_space | cut -d= -f2 | sed 's/^ //') != 0 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38597 (CAT II) The system must limit the ability of processes to have simultaneous write and execute access to memory. (1)
V='V-38597 CAT-II' ; if [[ $(sysctl kernel.exec-shield | cut -d= -f2 | sed 's/^ //') == 1 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38599 (CAT II) The FTPS/FTP service on the system must be configured with the Department of Defense (DoD) login banner.
V='V-38599 CAT-II' ; if [[ $(grep "banner_file" /etc/vsftpd/vsftpd.conf | awk -F= '{print $2}') != /etc/issue ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38600 (CAT II) The system must not send ICMPv4 redirects by default. (0)
V='V-38600 CAT-II' ; if [[ $(sysctl net.ipv4.conf.default.send_redirects | cut -d= -f2 | sed 's/^ //') == 0 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38601 (CAT II) The system must not send ICMPv4 redirects from any interface. (0)
V='V-38601 CAT-II' ; if [[ $(sysctl net.ipv4.conf.all.send_redirects | cut -d= -f2 | sed 's/^ //') == 0 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38603 (CAT II) The ypserv package must not be installed.
V='V-38603 CAT-II' ; if [[ -n $(rpm -q ypserv | grep "not installed") ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38604 (CAT II) The ypbind service must not be running.
V='V-38604 CAT-II' ; if [[ -n $(service ypbind status | grep running) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38605 (CAT II) The cron service must be running.
V='V-38605 CAT-II' ; if [[ -n $(service crond status | grep running) ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38606 (CAT II) The tftp-server package must not be installed.
V='V-38606 CAT-II' ; if [[ -n $(rpm -q tftp-server | grep "not installed") ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38609 (CAT II) The TFTP service must not be running.
V='V-38609 CAT-II' ; if [[ -n $(service tftpd status | grep running) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38611 (CAT II) The SSH daemon must ignore .rhosts files.
V='V-38611 CAT-II' ; if [[ -n $(grep -i IgnoreRhosts /etc/ssh/sshd_config | grep yes) ]] || [[ -z $(grep -i IgnoreRhosts /etc/ssh/sshd_config) ]] ; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38612 (CAT II) The SSH daemon must not allow host-based authentication.
V='V-38612 CAT-II' ; if [[ -n $(grep -i HostbasedAuthentication /etc/ssh/sshd_config | grep no) ]] || [[ -z $(grep -i HostbasedAuthentication /etc/ssh/sshd_config) ]] ; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38613 (CAT II) The system must not permit root logins using remote access programs such as ssh.
V='V-38613 CAT-II' ; if [[ $(grep -i PermitRootLogin /etc/ssh/sshd_config | grep -v ^# | awk '{print $2}') != yes ]] ; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38615 (CAT II) The SSH daemon must be configured with the Department of Defense (DoD) login banner.
V='V-38615 CAT-II' ; if [[ $(grep -i Banner /etc/ssh/sshd_config | grep -v ^# | awk '{print $2}') != /etc/issue ]] ; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38617 (CAT II) The SSH daemon must be configured to use only FIPS 140-2 approved ciphers.
V='V-38617 CAT-II' ; if [[ -n $(grep Ciphers /etc/ssh/sshd_config | sed 's/,/\n/g' | grep -v 'aes\|des') ]] ; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38619 (CAT II) There must be no .netrc files on the system.
V='V-38619 CAT-II' ; if [[ -n $(find /home -xdev -name .netrc) ]] ; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38620 (CAT II) The system clock must be synchronized continuously, or at least daily.
V='V-38620 CAT-II' ; if [[ -n $(service ntpd status | grep running) ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38621 (CAT II) The system clock must be synchronized to an authoritative DoD time source.
V='V-38621 CAT-II' ; if [[ -n $(grep server /etc/ntp.conf | grep -v ^# | grep -v 127.*.*.) ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38622 (CAT II) Mail relaying must be restricted.
V='V-38622 CAT-II' ; if [[ $(grep inet_interfaces /etc/postfix/main.cf | grep -v ^# | awk -F= '{print $2}' | sed 's/[[:space:]]//g') == localhost ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38623 (CAT II) All rsyslog-generated log files must have mode 0600 or less permissive.
V='V-38623 CAT-II' ; if [[ -n $(cat /etc/rsyslog.conf | grep -v '^#' | grep var | grep -o '[^\/]*$' | sed -e 's/^/\/var\/log\//g' | xargs stat -c "%a %n" | awk '{print $1}' | awk '{if($1==$1+0 && $1>600)print $1}') ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38625 (CAT II) If the system is using LDAP for authentication or account information, the system must use a TLS connection using FIPS 140-2 approved cryptographic algorithms.
V='V-38625 CAT-II' ; if [[ -z $(grep start_tls /etc/pam_ldap.conf) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38626 (CAT II) The LDAP client must use a TLS connection using trust certificates signed by the site CA.
V='V-38626 CAT-II' ; if [[ -z $(grep cert /etc/pam_ldap.conf) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38628 (CAT II) The operating system must produce audit records containing sufficient information to establish the identity of any user/subject associated with the event.
V='V-38628 CAT-II' ; if [[ -n $(service auditd status | grep running) ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38629 (CAT II) The graphical desktop environment must set the idle timeout to no more than 15 minutes.
V='V-38629 CAT-II' ; if [[ 15 -eq $(gconftool-2 -g /apps/gnome-screensaver/idle_delay) ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38630 (CAT II) The graphical desktop environment must automatically lock after 15 minutes of inactivity and the system must require user to re-authenticate to unlock the environment.
V='V-38630 CAT-II' ; if [[ true == $(gconftool-2 -g /apps/gnome-screensaver/idle_activation_enabled) ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38631 (CAT II) The operating system must employ automated mechanisms to facilitate the monitoring and control of remote access methods.
V='V-38631 CAT-II' ; if [[ -n $(service auditd status | grep running) ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38632 (CAT II) The operating system must produce audit records containing sufficient information to establish what type of events occurred.
V='V-38632 CAT-II' ; if [[ -n $(service auditd status | grep running) ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38633 (CAT II) The system must set a maximum audit log file size.
V='V-38633 CAT-II' ; if [[ $(grep max_log_file /etc/audit/auditd.conf | grep -v action |awk -F= '{if($2==$2+0) print $2}' | sed 's/[[:space:]]//g') -ge 6 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38634 (CAT II) The system must rotate audit log files that reach the maximum file size.
V='V-38634 CAT-II' ; if [[ $(grep max_log_file_action /etc/audit/auditd.conf | awk -F= '{print $2}' | sed 's/[[:space:]]//g') == rotate ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38636 (CAT II) The system must retain enough rotated audit logs to cover the required log retention period.
V='V-38636 CAT-II' ; if [[ $(grep num_logs /etc/audit/auditd.conf | awk -F= '{if($2==$2+0) print $2}' | sed 's/[[:space:]]//g') -gt 2 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38637 (CAT II) The system package management tool must verify contents of all files associated with the audit package.
V='V-38637 CAT-II' ; if [[ -n $(rpm -V audit | grep '$1 ~ /..5/ && $2 != "c"') ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38638 (CAT II) The graphical desktop environment must have automatic lock enabled.
V='V-38638 CAT-II' ; if [[ $(gconftool-2 -g /apps/gnome-screensaver/lock_enabled) == true ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38643 (CAT II) There must be no world-writable files on the system.
V='V-38643 CAT-II' ; if [[ -n $(find / -xdev -type f -perm -002) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38652 (CAT II) Remote file systems must be mounted with the nodev option.
V='V-38652 CAT-II' ; if [[ -n $(mount | grep nfs | grep nodev) ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38654 (CAT II) Remote file systems must be mounted with the nosuid option.
V='V-38654 CAT-II' ; if [[ -n $(mount | grep nfs | grep nosuid) ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38658 (CAT II) The system must prohibit the reuse of passwords within twenty-four iterations.
V='V-38658 CAT-II' ; if [[ $(grep remember /etc/pam.d/system-auth | awk -F= '{if($2==$2+0) print $2}' | sed 's/[[:space:]]//g') -ge 24 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38660 (CAT II) The snmpd service must use only SNMP protocol version 3 or newer.
V='V-38660 CAT-II' ; if [[ -n $(grep 'v1\|v2c\|com2sec' /etc/snmp/snmpd.conf | grep -v '^#') ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38663 (CAT II) The system package management tool must verify permissions on all files and directories associated with the audit package. (no output)
V='V-38663 CAT-II' ; if [[ -n $(rpm -V audit | grep '^.M') ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38664 (CAT II) The system package management tool must verify ownership on all files and directories associated with the audit package.
V='V-38664 CAT-II' ; if [[ -n $(rpm -V audit | grep '^.....U') ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38665 (CAT II) The system package management tool must verify group-ownership on all files and directories associated with the audit package.
V='V-38665 CAT-II' ; if [[ -n $(rpm -V audit | grep '^......G') ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38667 (CAT II) The system must have a host-based intrusion detection tool installed.
V='V-38667 CAT-II' ; echo "$V Manual Review Required"

#V-38670 (CAT II) The operating system must detect unauthorized changes to software and information. 
V='V-38670 CAT-II' ; if [[ -z $(grep aide /etc/crontab) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38671 (CAT II) The sendmail package must be removed.
V='V-38671 CAT-II' ; if [[ -n $(rpm -q sendmail | grep "not installed") ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38673 (CAT II) The operating system must ensure unauthorized, security-relevant configuration changes detected are tracked.
V='V-38673 CAT-II' ; if [[ -z $(grep aide /etc/crontab) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38674 (CAT II) X Windows must not be enabled unless required.
V='V-38674 CAT-II' ; if [[ $(grep initdefault /etc/inittab | grep -v ^# | awk -F: '{print $2}') -ne 3 ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38678 (CAT II) The audit system must provide a warning when allocated audit record storage volume reaches a documented percentage of maximum audit record storage capacity.
V='V-38678 CAT-II' ; if [[ -n $(grep ^space_left /etc/audit/auditd.conf | grep -v action) ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38679 (CAT II) The DHCP client must be disabled if not needed. 
V='V-38679 CAT-II' ; if [[ $(grep BOOTPROTO /etc/sysconfig/network-scripts/ifcfg-* | awk -F= '{print $2}') != static ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38680 (CAT II) The audit system must identify staff members to receive notifications of audit log storage volume capacity issues.
V='V-38680 CAT-II' ; if [[ -n $(grep action_mail_acct /etc/audit/auditd.conf | grep -v ^#) ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38682 (CAT II) The Bluetooth kernel module must be disabled.
V='V-38682 CAT-II' ; if [[ -n $(grep -r net-pf-31 /etc/modprobe*) && -n $(grep -r bluetooth /etc/modprobe*) ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38686 (CAT II) The systems local firewall must implement a deny-all, allow-by-exception policy for forwarded packets.
V='V-38686 CAT-II' ; if [[ -n $(grep ":FORWARD" /etc/sysconfig/iptables | grep DROP) ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38688 (CAT II) A login banner must be displayed immediately prior to, or as part of, graphical desktop environment login prompts.
V='V-38688 CAT-II' ; if [[ $(gconftool-2 -g /apps/gdm/simple-greeter/banner_message_enable) == true ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38689 (CAT II) The Department of Defense (DoD) login banner must be displayed immediately prior to, or as part of, graphical desktop environment login prompts.
V='V-38689 CAT-III' ; echo "$V Manual Review Required"

#V-38691 (CAT II) The Bluetooth service must be disabled.
V='V-38691 CAT-II' ; if [[ -n $(chkconfig --list | grep bluetooth | grep on) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38695 (CAT II) A file integrity tool must be used at least weekly to check for unauthorized file changes, particularly the addition of unauthorized system libraries or binaries, or for unauthorized modification to authorized system libraries or binaries.
V='V-38695 CAT-II' ; if [[ -z $(grep aide /etc/crontab) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38696 (CAT II) The operating system must employ automated mechanisms, per organization defined frequency, to detect the addition of unauthorized components/devices into the operating system.
V='V-38696 CAT-II' ; if [[ -z $(grep aide /etc/crontab) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38698 (CAT II) The operating system must employ automated mechanisms to detect the presence of unauthorized software on organizational information systems and notify designated organizational officials in accordance with the organization defined frequency.
V='V-38698 CAT-II' ; if [[ -z $(grep aide /etc/crontab) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38700 (CAT II) The operating system must provide a near real-time alert when any of the organization defined list of compromise or potential compromise indicators occurs.  
V='V-38700 CAT-II' ; if [[ -z $(grep aide /etc/crontab) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#################################################################
#	 							#
#	 		CAT III					#
#	 							#
#################################################################

#V-38437 (CAT III) Automated file system mounting tools must not be enabled unless needed.
V='V-38437 CAT-III' ; if [[ -n $(service autofs status | grep running) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38438 (CAT III) Auditing must be enabled at boot by setting a kernel parameter.
V='V-38438 CAT-III' ; if [[ $(grep audit /etc/grub.conf | sed 's/[[:space:]]//' | grep ^kernel | sed 's/[[:space:]]/\n/g' | grep audit | awk -F= '{print $2}' | uniq) -eq 1 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38447 (CAT III) The system package management tool must verify contents of all files associated with packages.
V='V-38447 CAT-III' ; if [[ -n $(rpm -Va | grep '$1 ~ /..5/ && $2 != "c"') ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38452 (CAT III) The system package management tool must verify permissions on all files and directories associated with packages.
V='V-38452 CAT-III' ; if [[ -n $(rpm -Va | grep '^.M') ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38453 (CAT III) The system package management tool must verify group-ownership on all files and directories associated with packages.
V='V-38453 CAT-III' ; if [[ -n $(rpm -Va | grep '^......G') ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38454 (CAT III) The system package management tool must verify ownership on all files and directories associated with packages.
V='V-38454 CAT-III' ; if [[ -n $(rpm -Va | grep '^.....U') ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38455 (CAT III) The system must use a separate file system for /tmp.
V='V-38455 CAT-III' ; if [[ -n $(mount | grep "on /tmp ") ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38456 (CAT III) The system must use a separate file system for /var.
V='V-38456 CAT-III' ; if [[ -n $(mount | grep "on /var ") ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38460 (CAT III) The NFS server must not have the all_squash option enabled.
V='V-38460 CAT-III' ; if [[ -n $(grep all_squash /etc/exports) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38463 (CAT III) The system must use a separate file system for /var/log.
V='V-38463 CAT-III' ; if [[ -n $(mount | grep "on /var/log ") ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38467 (CAT III) The system must use a separate file system for the system audit data path.
V='V-38467 CAT-III' ; if [[ -n $(mount | grep "on /var/log/audit ") ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38471 (CAT III) The system must forward audit records to the syslog service.
V='V-38471 CAT-III' ; if [[ -z $(grep active /etc/audisp/plugins.d/syslog.conf | awk -F= '{print $2}' | sed 's/[[:space:]]//g') ]] || [[ $(grep active /etc/audisp/plugins.d/syslog.conf | awk -F= '{print $2}' | sed 's/[[:space:]]//g') == no ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38473 (CAT III) The system must use a separate file system for user home directories.
V='V-38473 CAT-III' ; if [[ -n $(mount | grep "on /home ") ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38474 (CAT III) The system must allow locking of graphical desktop sessions.
V='V-38474 CAT-III' ; if [[ -z $( gconftool-2 --direct --config-source xml:readwrite:/etc/gconf/gconf.xml.mandatory --get /apps/gnome_settings_daemon/keybindings/screensaver) ]] || [[ -n $(gconftool-2 --direct --config-source xml:readwrite:/etc/gconf/gconf.xml.mandatory --get /apps/gnome_settings_daemon/keybindings/screensaver | grep ^No) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38478 (CAT III) The Red Hat Network Service (rhnsd) service must not be running, unless using RHN or an RHN Satellite.
V='V-38478 CAT-III' ; if [[ -n $(service rhnsd status | grep running) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38480 (CAT III) Users must be warned 7 days in advance of password expiration.
V='V-38480 CAT-III' ; if [[ $(grep PASS_WARN_AGE /etc/login.defs | grep -v ^# | awk '{print $2}') -ge 7 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38482 (CAT III) The system must require passwords to contain at least one numeric character.
V='V-38482 CAT-III' ; if [[ $(grep pam_cracklib /etc/pam.d/system-auth | grep -v ^# | grep dcredit | awk -F= '{print $2}') -ge 1 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38487 (CAT III) The system package management tool must cryptographically verify the authenticity of all software packages during installation.
V='V-38487 CAT-III' ; if [[ -n $(grep -r gpgcheck /etc/yum* | grep 0) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38494 (CAT III) The system must prevent the root account from logging in from serial consoles.
V='V-38494 CAT-III' ; if [[ -n $(grep '^ttyS[0-9]' /etc/securetty) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38516 (CAT III) The Reliable Datagram Sockets (RDS) protocol must be disabled unless required.
V='V-38516 CAT-III' ; if [[ -z $(grep -r rds /etc/modprobe* | awk -F: '{print $2}' | grep -v ^#) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38522 (CAT III) The audit system must be configured to audit all attempts to alter system time through settimeofday.
V='V-38522 CAT-III' ; if [[ -n $(auditctl -l | grep syscall | grep settimeofday) ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38525 (CAT III) The audit system must be configured to audit all attempts to alter system time through stime.
V='V-38525 CAT-III' ; if [[ -n $(auditctl -l | grep syscall | grep stime) ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38527 (CAT III) The audit system must be configured to audit all attempts to alter system time through clock_settime.
V='V-38527 CAT-III' ; if [[ -n $(auditctl -l | grep syscall | grep clock_settime) ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38528 (CAT III) The system must log Martian packets.(1)
V='V-38528 CAT-III' ; if [[ $(sysctl net.ipv4.conf.all.log_martians | cut -d= -f2 | sed 's/^ //') == 1 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38530 (CAT III) The audit system must be configured to audit all attempts to alter system time through /etc/localtime.
V='V-38530 CAT-III' ; if [[ -n $(auditctl -l | grep "watch=/etc/localtime") ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38531 (CAT III) The operating system must automatically audit account creation.
V='V-38531 CAT-III' ; if [[ $(auditctl -l | egrep '(/etc/passwd|/etc/shadow|/etc/group|/etc/gshadow|/etc/security/opasswd)' | grep "perm=wa" | wc -l) -eq 5 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38533 (CAT III) The system must ignore IPv4 ICMP redirect messages.(0)
V='V-38533 CAT-III' ; if [[ $(sysctl net.ipv4.conf.default.accept_redirects | cut -d= -f2 | sed 's/^ //') == 0 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38534 (CAT III) The operating system must automatically audit account modification.
V='V-38534 CAT-III' ; if [[ $(auditctl -l | egrep '(/etc/passwd|/etc/shadow|/etc/group|/etc/gshadow|/etc/security/opasswd)' | grep "perm=wa" | wc -l) -eq 5 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38535 (CAT III) The system must not respond to ICMPv4 sent to a broadcast address.(1)
V='V-38535 CAT-III' ; if [[ $(sysctl net.ipv4.icmp_echo_ignore_broadcasts | cut -d= -f2 | sed 's/^ //') == 1 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38536 (CAT III) The operating system must automatically audit account disabling actions.
V='V-38536 CAT-III' ; if [[ $(auditctl -l | egrep '(/etc/passwd|/etc/shadow|/etc/group|/etc/gshadow|/etc/security/opasswd)' | grep "perm=wa" | wc -l) -eq 5 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38537 (CAT III) The system must ignore ICMPv4 bogus error responses.(1)
V='V-38537 CAT-III' ; if [[ $(sysctl net.ipv4.icmp_ignore_bogus_error_responses | cut -d= -f2 | sed 's/^ //') == 1 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38538 (CAT III) The operating system must automatically audit account termination.
V='V-38538 CAT-III' ; if [[ $(auditctl -l | egrep '(/etc/passwd|/etc/shadow|/etc/group|/etc/gshadow|/etc/security/opasswd)' | grep "perm=wa" | wc -l) -eq 5 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38540 (CAT III) The audit system must be configured to audit modifications to the systems network configuration.
V='V-38540 CAT-III' ; if [[ $(auditctl -l | egrep '(sethostname|setdomainname|/etc/issue |/etc/issue.net |/etc/hosts |/etc/sysconfig/network )' | grep "perm=wa" | wc -l) -eq 4 ]] && [[ $(auditctl -l | egrep '(sethostname|setdomainname|/etc/issue |/etc/issue.net |/etc/hosts |/etc/sysconfig/network )' | wc -l) -eq 6 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38541 (CAT III) The audit system must be configured to audit modifications to the systems Mandatory Access Control (MAC) configuration (SELinux).
V='V-38541 CAT-III' ; if [[ -n $(auditctl -l | grep "dir=/etc/selinux" | grep "perm=wa") ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38543 (CAT III) The audit system must be configured to audit all discretionary access control permission modifications using chmod.
V='V-38543 CAT-III' ; if [[ -z $(auditctl -l | grep syscall | grep chmod) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38545 (CAT III) The audit system must be configured to audit all discretionary access control permission modifications using chown.
V='V-38545 CAT-III' ; if [[ -z $(auditctl -l | grep syscall | grep chown) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38547 (CAT III) The audit system must be configured to audit all discretionary access control permission modifications using fchmod.
V='V-38547 CAT-III' ; if [[ -z $(auditctl -l | grep syscall | grep fchmod) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38550 (CAT III) The audit system must be configured to audit all discretionary access control permission modifications using fchmodat.
V='V-38550 CAT-III' ; if [[ -z $(auditctl -l | grep syscall | grep fchmodat) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38552 (CAT III) The audit system must be configured to audit all discretionary access control permission modifications using fchown.
V='V-38552 CAT-III' ; if [[ -z $(auditctl -l | grep syscall | grep fchown) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38554 (CAT III) The audit system must be configured to audit all discretionary access control permission modifications using fchownat.
V='V-38554 CAT-III' ; if [[ -z $(auditctl -l | grep syscall | grep fchownat) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38556 (CAT III) The audit system must be configured to audit all discretionary access control permission modifications using fremovexattr.
V='V-38556 CAT-III' ; if [[ -z $(auditctl -l | grep syscall | grep fremovexattr) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38557 (CAT III) The audit system must be configured to audit all discretionary access control permission modifications using fsetxattr.
V='V-38557 CAT-III' ; if [[ -z $(auditctl -l | grep syscall | grep fsetxattr) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38558 (CAT III) The audit system must be configured to audit all discretionary access control permission modifications using lchown.
V='V-38558 CAT-III' ; if [[ -z $(auditctl -l | grep syscall | grep lchown) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38559 (CAT III) The audit system must be configured to audit all discretionary access control permission modifications using lremovexattr.
V='V-38559 CAT-III' ; if [[ -z $(auditctl -l | grep syscall | grep lremovexattr) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38561 (CAT III) The audit system must be configured to audit all discretionary access control permission modifications using lsetxattr.
V='V-38561 CAT-III' ; if [[ -z $(auditctl -l | grep syscall | grep lsetxattr) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38563 (CAT III) The audit system must be configured to audit all discretionary access control permission modifications using removexattr.
V='V-38563 CAT-III' ; if [[ -z $(auditctl -l | grep syscall | grep removexattr) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38565 (CAT III) The audit system must be configured to audit all discretionary access control permission modifications using setxattr.
V='V-38565 CAT-III' ; if [[ -z $(auditctl -l | grep syscall | grep setxattr) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38566 (CAT III) The audit system must be configured to audit failed attempts to access files and programs.
V='V-38566 CAT-III' ; if [[ -z $(grep EACCES /etc/audit/audit.rules) ]] || [[ -z $(grep EPERM /etc/audit/audit.rules) ]] ; then echo "$V Finding" ; else echo "$V No Finding" ; fi


######### Incomplete ##############
#
#
#V-38567 (CAT III) The audit system must be configured to audit all use of setuid programs.
V='V-38567 CAT-III' ; echo "$V Manual Review Required"
#
#
######### Incomplete ##############


#V-38568 (CAT III) The audit system must be configured to audit successful file system mounts.
V='V-38568 CAT-III' ; if [[ -z $(auditctl -l | grep syscall | grep mount) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38569 (CAT III) The system must require passwords to contain at least one uppercase alphabetic character.
V='V-38569 CAT-III' ; if [[ $(grep pam_cracklib /etc/pam.d/system-auth | grep -v ^# | grep ucredit | awk -F= '{print $2}') -ge 1 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38570 (CAT III) The system must require passwords to contain at least one special character.
V='V-38570 CAT-III' ; if [[ $(grep pam_cracklib /etc/pam.d/system-auth | grep -v ^# | grep ocredit | awk -F= '{print $2}') -ge 1 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38571 (CAT III) The system must require passwords to contain at least one lowercase alphabetic character.
V='V-38571 CAT-III' ; if [[ $(grep pam_cracklib /etc/pam.d/system-auth | grep -v ^# | grep lcredit | awk -F= '{print $2}') -ge 1 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38572 (CAT III) The system must require at least four characters be changed between the old and new passwords during a password change.
V='V-38572 CAT-III' ; if [[ $(grep pam_cracklib /etc/pam.d/system-auth | grep -v ^# | grep difok | awk -F= '{print $2}') -ge 4 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi


######### Incomplete ##############
#
#
#V-38575 (CAT III) The audit system must be configured to audit user deletions of files and programs.
V='V-38575 CAT-III' ; echo "$V Manual Review Required"
#
#
######### Incomplete ##############


#V-38578 (CAT III) The audit system must be configured to audit changes to the /etc/sudoers file.
V='V-38578 CAT-III' ; if [[ -z $(auditctl -l | grep "watch=/etc/sudoers") ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38584 (CAT III) The xinetd service must be uninstalled if no network services utilizing it are enabled.
V='V-38584 CAT-III' ; if [[ -n $(rpm -q xinetd | grep "not installed") ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38590 (CAT III) The system must allow locking of the console screen in text mode.
V='V-38590 CAT-III' ; if [[ -n $(rpm -q screen | grep "not installed") ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38608 (CAT III) The SSH daemon must set a timeout interval on idle sessions.
V='V-38608 CAT-III' ; if [[ $(grep ClientAliveInterval /etc/ssh/sshd_config | grep -v ^# | awk '{print $2}') -ne 900 ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38610 (CAT III) The SSH daemon must set a timeout count on idle sessions.
V='V-38610 CAT-III' ; if [[ $(grep ClientAliveCountMax /etc/ssh/sshd_config | grep -v ^# | awk '{print $2}') -ne 0 ]] || [[ -z $(grep ClientAliveCountMax /etc/ssh/sshd_config | grep -v ^# | awk '{print $2}') ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38616 (CAT III) The SSH daemon must not permit user environment settings.
V='V-38616 CAT-III' ; if [[ $(grep PermitUserEnvironment /etc/ssh/sshd_config | grep -v ^#) != no ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38618 (CAT III) The avahi service must be disabled.
V='V-38618 CAT-III' ; if [[ -n $(service avahi-daemon status | grep running) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38624 (CAT III) System logs must be rotated daily.
V='V-38624 CAT-III' ; echo "$V Manual Review Required"

#V-38627 (CAT III) The openldap-servers package must not be installed unless required.
V='V-38627 CAT-III' ; if [[ -n $(rpm -q openldap-servers | grep "not installed") ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38635 (CAT III) The audit system must be configured to audit all attempts to alter system time through adjtimex.
V='V-38635 CAT-III' ; if [[ -n $(auditctl -l | grep syscall | grep adjtimex) ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38639 (CAT III) The system must display a publicly-viewable pattern during a graphical desktop environment session lock.
V='V-38639 CAT-III' ; if [[ $(gconftool-2 -g /apps/gnome-screensaver/mode) == blank-only ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38640 (CAT III) The Automatic Bug Reporting Tool (abrtd) service must not be running.
V='V-38640 CAT-III' ; if [[ -n $(service abrtd status | grep running) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38641 (CAT III) The atd service must be disabled.
V='V-38641 CAT-III' ; if [[ -n $(service atd status | grep running) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38642 (CAT III) The system default umask for daemons must be 027 or 022.
V='V-38642 CAT-III' ; if [[ $(grep umask /etc/init.d/functions |grep -v ^#| awk '{print $2}') -eq 022 ]] || [[ $(grep umask /etc/init.d/functions |grep -v ^#| awk '{print $2}') -eq 027 ]] ; then echo "$V No Finding" ; else echo "Finding" ; fi

#V-38644 (CAT III) The ntpdate service must not be running.
V='V-38644 CAT-III' ; if [[ -n $(service ntpdate status | grep running) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38645 (CAT III) The system default umask in /etc/login.defs must be 077.
V='V-38645 CAT-III' ; if [[ $(grep -i "umask" /etc/login.defs | awk '{print $2}') -eq 077 ]]; then echo "$V No Finding" ; else echo "Finding" ; fi

#V-38646 (CAT III) The oddjobd service must not be running.
V='V-38646 CAT-III' ; if [[ -n $(service oddjobd status | grep running) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38647 (CAT III) The system default umask in /etc/profile must be 077.
V='V-38647 CAT-III' ; if [[ $(grep "umask" /etc/profile | grep -v ^# | awk '{print $2}' | uniq) -eq 077 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38648 (CAT III) The qpidd service must not be running.
V='V-38648 CAT-III' ; if [[ -n $(service qpidd status | grep running) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38649 (CAT III) The system default umask for the csh shell must be 077.
V='V-38649 CAT-III' ; if [[ $(grep "umask" /etc/csh.cshrc | awk '{print $2}' | uniq) -ne 077 ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38650 (CAT III) The rdisc service must not be running.
V='V-38650 CAT-III' ; if [[ -n $(service rdisc status | grep running) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38651 (CAT III) The system default umask for the bash shell must be 077.
V='V-38651 CAT-III' ; if [[ $(grep "umask" /etc/bashrc | awk '{print $2}' | uniq) -ne 077 ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38655 (CAT III) The noexec option must be added to removable media partitions.
V='V-38655 CAT-III' ; echo "$V Manual Review Required"

#V-38656 (CAT III) The system must use SMB client signing for connecting to samba servers using smbclient.
V='V-38656 CAT-III' ; if [[ $(grep signing /etc/samba/smb.conf | awk -F= '{print $2}' | sed 's/[[:space:]]//g') != mandatory ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38657 (CAT III) The system must use SMB client signing for connecting to samba servers using mount.cifs.
V='V-38657 CAT-III' ; if [[ -n $(grep sec /etc/fstab | grep 'krb5i \| ntlmv2i') ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38659 (CAT III) The operating system must employ cryptographic mechanisms to protect information in storage.
V='V-38659 CAT-III' ; echo "$V Manual Review Required"

#V-38661 (CAT III) The operating system must protect the confidentiality and integrity of data at rest. 
V='V-38661 CAT-III' ; echo "$V Manual Review Required"

#V-38662 (CAT III) The operating system must employ cryptographic mechanisms to prevent unauthorized disclosure of data at rest unless otherwise protected by alternative physical measures.
V='V-38662 CAT-III' ; echo "$V Manual Review Required"

#V-38669 (CAT III) The postfix service must be enabled for mail delivery.
V='V-38669 CAT-III' ; if [[ -n $(service postfix status | grep running) ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38672 (CAT III) The netconsole service must be disabled unless required.
V='V-38672 CAT-III' ; if [[ -n $(service netconsole status | grep running) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38675 (CAT III) Process core dumps must be disabled unless needed.
V='V-38675 CAT-III' ; if [[ $(grep core /etc/security/limits.conf | grep -v ^# | awk '{print $2}') == "-" ]] || [[ $(grep core /etc/security/limits.conf | grep -v ^# | awk '{print $2}') == hard ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38676 (CAT III) The xorg-x11-server-common (X Windows) package must not be installed, unless required.
V='V-38676 CAT-III' ; if [[ -n $(rpm -q xorg-x11-server-common | grep "not installed") ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38681 (CAT III) All GIDs referenced in /etc/passwd must be defined in /etc/group
V='V-38681 CAT-III' ; if [[ -n $(pwck -rq) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38683 (CAT III) All accounts on the system must have unique user or account names
V='V-38683 CAT-III' ; if [[ -n $(pwck -rq) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38684 (CAT III) The system must limit users to 10 simultaneous system logins, or a site-defined number, in accordance with operational requirements.
V='V-38684 CAT-III' ; echo "$V Manual Review Required"

#V-38685 (CAT III) Temporary accounts must be provisioned with an expiration date.
V='V-38685 CAT-III' ; echo "$V Manual Review Required"

#V-38687 (CAT III) The system must provide VPN connectivity for communications over untrusted networks.
V='V-38687 CAT-III' ; if [[ -n $(rpm -q openswan | grep "not installed") ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38690 (CAT III) Emergency accounts must be provisioned with an expiration date.
V='V-38690 CAT-III' ; echo "$V Manual Review Required"

#V-38692 (CAT III) Accounts must be locked upon 35 days of inactivity.
V='V-38692 CAT-III' ; if [[ $(grep "INACTIVE" /etc/default/useradd | awk -F= '{print $2}') -ne 35 ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38693 (CAT III) The system must require passwords to contain no more than three consecutive repeating characters.
V='V-38693 CAT-III' ; if [[ $(grep pam_cracklib /etc/pam.d/system-auth | grep -v ^# | grep maxrepeat| awk -F= '{print $2}') -eq 3 ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38694 (CAT III) The operating system must manage information system identifiers for users and devices by disabling the user identifier after an organization defined time period of inactivity.
V='V-38694 CAT-III' ; if [[ $(grep "INACTIVE" /etc/default/useradd | awk -F= '{print $2}') -ne 35 ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38697 (CAT III) The sticky bit must be set on all public directories.
V='V-38697 CAT-III' ; if [[ -n $(find / -xdev -type d -perm 002 ! -perm 1000) ]]; then echo "$V Finding" ; else echo "$V No Finding" ; fi

#V-38699 (CAT III) All public directories must be owned by a system account.
V='V-38699 CAT-III' ; if [[ -z $(find /dev/sd* -xdev -type d -perm 0002 -uid +500 -print) ]] && [[ -z $(find /dev/mapper/* -xdev -type d -perm 0002 -uid +500 -print) ]]; then echo "$V No Finding" ; else echo "$V Finding" ; fi

#V-38702 (CAT III) The FTP daemon must be configured for logging or verbose mode.
V='V-38702 CAT-III' ; echo "$V Manual Review Required"


