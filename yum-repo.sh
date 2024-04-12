#################################################################
#								#
#			Yum Repo				#
#								#
#################################################################

# =================================================================
# ========================Server/Repo==============================
# =================================================================


# put packages in desired location (e.g. /opt/repos/<REPO-NAME>)
createrepo <specified location>

#specify baseurl redirect to repo location

# =================================================================
# ============================Client===============================
# =================================================================
vi /etc/hosts

	# ...
	# <IP> <REPO-HOSTNAME>


vi /etc/yum.repos.d/<REPO-NAME>

	# [<REPO-NAME>]
	# name=<name>
	# baseurl=http://<ip/path>
	# enabled=1
	# gpgcheck=0

#disable rhnplugin if not official or disconnect system
vi /etc/yum/pluginconf.d/rhnplugin.conf

	# ...
	# enabled=0
	# ...
