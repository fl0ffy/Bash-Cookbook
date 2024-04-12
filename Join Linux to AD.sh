
#################################################################
#								#
#			Join Linux to AD			#
#								#
#################################################################

# =================================================================
# ========================Likewise / PBIS==========================
# =================================================================

#Set SELinux to permissive
getenforce
setenforce permissive

#install likewise

yum -y install likewise
OR
rpm -ivh <likewise.rpm>

#add server to domain
/opt/likewise/bin/domainjoin-cli join <DOMAIN> <DOMAIN ADMIN USER>
/opt/likewise/bin/domainjoin-cli query
/opt/likewise/bin/lwconfig AssumeDefaultDomain True
service lwsmd restart

#Add Linux Admin group to sudoers
visudo

#Set default shell
/opt/likewise/bin/lwregshell set_value '[HKEY_THIS_MACHINE\Services\lsass\Parameters\Providers\ActiveDirectory]' LoginShellTemplate /bin/bash
/opt/likewise/bin/lwregshell set_value '[HKEY_THIS_MACHINE\Services\lsass\Parameters\Providers\Local]' LoginShellTemplate /bin/bash
/opt/likewise/bin/lwsm refresh lsass

/opt/likewise/bin/lw-ad-cache --delete-all

# =================================================================
# ==============================Quest==============================
# =================================================================

/opt/quest/bin/vastool -u <DOMAIN ADMIN USER> join -f <DOMAIN>
/opt/quest/bin/vastool -u <DOMAIN ADMIN USER> info domain

# =================================================================
# =========================Centrify Express========================
# =================================================================

#install
cp centrify-suite-2013.3-rhel3-x86_64.tgz /opt/<dir>/
cd /opt/<dir>/
tar xvzf centrify-suite-2013.3-rhel3-x86_64.tgz
./install-express.sh
adcheck <domain>


#attribute Domain Admins with wheel group
cd /etc/centrifydc/
cp passwd.ovr.sample passwd.ovr
vi passwd.ovr
	# ...
	# +@Domain Admins::::10:
	# +:::::::

adreload
adflush
