
#################################################################
#								#
#			Splunk					#
#								#
#################################################################

# =================================================================
# ===========================Indexer===============================
# =================================================================

yum -y install splunk OR rpm -ivh splunk.rpm
/opt/splunk/bin/splunk start --accept-license
/opt/splunk/bin/splunk enable boot-start

# goto: http://<IPADDR>:8000


# ------------------------------------------------------------------
# ------------------------------HTTPs-------------------------------
# ------------------------------------------------------------------

# goto: http://<IPADDR>:8000
# login with admin credentials
# navigate to : Manager > System settings > General settings
# change Enable SSL (HTTPS) in splunk web to yes
# restart splunk

# goto: https://<IPADDR>:8000
# accept certificate
# login

# ------------------------------------------------------------------
# ------------------------Enable SSL Receiving----------------------
# ------------------------------------------------------------------

vi /opt/splunk/etc/system/local/inputs.conf

  # [default]
  # host = <HOSTNAME>

  # [splunktcp-ssl:<PORT>]
  # compressed = true

  # [SSL]
  # password = password #will hash after splunk restart
  # rootCA = $SPLUNK_HOME/etc/auth/cacert.pem
  # serverCert = $SPLUNK_HOME/etc/auth/server.pem

/opt/splunk/bin/splunk restart

# verify:
cat /opt/splunk/var/log/splunk/splunkd.log | grep reserved
	TcpInputConfig - IPv4 port <PORT> is reserved for splunk 2 splunk (SSL)

# ------------------------------------------------------------------
# ---------------------------Monitor /var/log-----------------------
# ------------------------------------------------------------------

vi /opt/splunk/etc/apps/search/local/inputs.conf

  # [monitor:///var/log]
  # disabled = false
  # sourcetype = syslog
  # _blacklist = .*\.(gz|zip|bkz|arch|etc)$  #this rejects any compressed files/logs

/opt/splunk/bin/splunk/restart

# ------------------------------------------------------------------
# ------------------------Change index location---------------------
# ------------------------------------------------------------------

mkdir <DIR>
chown splunk <DIR>
/opt/splunk/bin/splunk stop
cp -rp /opt/splunk/var/lib/splunk/* <DIR> OR cp -rp $SPUNK_DB <DIR>
unset SPLUNK_DB
SPLUNK_DB=<DIR>
/opt/splunk/bin/splunk start

#Verify read/write to new location

rm -rf /opt/splunk/var/lib/splunk/*


# ------------------------------------------------------------------
# ---------------------------Archive indexes------------------------
# ------------------------------------------------------------------

# http://docs.splunk.com/Documentation/Splunk/5.0.3/Indexer/Automatearchiving
# http://docs.splunk.com/Documentation/Splunk/5.0.3/Indexer/Setaretirementandarchivingpolicy

# ------------------------------------------------------------------
# ------------------------Removing index data-----------------------
# ------------------------------------------------------------------

/opt/splunk/bin/splunk stop
#remove single
/opt/splunk/bin/splunk clean eventdata -index <INDEX_NAME>
#remove all
/opt/splunk/bin/splunk clean eventdata
/opt/splunk/bin/splunk start

# ------------------------------------------------------------------
# ---------------------Configure SSL Forwarding---------------------
# ------------------------------------------------------------------

vi /opt/splunk/etc/system/local/outputs.conf

  # [tcpout]
  # defaultGroup = splunkssl

  # [tcpout:splunkssl]
  # compressed = true
  # server = <IPADDR:PORT>  #enter primary indexer address and port
  # sslCertPath = $SPLUNK_HOME/etc/auth/server.pem
  # sslPassword = password #will hash after splunk restart
  # sslRootCAPath = $SPLUNK_HOME/etc/auth/cacert.pem
  # sslVerifyServerCert = false

/opt/splunk/bin/splunk restart

#verify - search for ssl and cipher
cat /opt/splunk/var/log/splunkd.log | grep cipher
	...INFO loader - using cipher suite ALL:!NULL:!LOW:!EXP:RC4+RSA:+HIGH:+MEDIUM


#################################################################
#								#
#		Splunk Forwarder (Linux)			#
#								#
#################################################################

yum -y install splunkforwarder OR rpm -ivh splunkforwarder.rpm
/opt/splunkforwarder/bin/splunk start --accept-license
/opt/splunkforwarder/bin/splunk enable boot-start
/opt/splunkforwarder/bin/splunk edit user admin -password <NEW_PASSWORD> -role admin -auth admin:changeme
/opt/splunkforwarder/bin/splunk set splunkd-port <MGMT_PORT>
/opt/splunkforwarder/bin/splunk restart

/opt/splunkforwarder/bin/splunk add forward-server <INDEXER_IP:PORT> -auth admin:<NEW_PASSWORD>
/opt/splunkforwarder/bin/splunk list forward-server

# =================================================================
# =======================Enable SSL Forwarding=====================
# =================================================================

vi /opt/splunkforwarder/etc/system/local/outputs.conf

  # [tcpout]
  # defaultGroup = splunkssl

  # [tcpout:splunkssl]
  # compressed = true
  # server = <IPADDR:PORT>  #enter indexer address and port
  # sslCertPath = $SPLUNK_HOME/etc/auth/server.pem
  # sslPassword = password #will hash after splunk restart
  # sslRootCAPath = $SPLUNK_HOME/etc/auth/cacert.pem
  # sslVerifyServerCert = false

/opt/splunkforwarder/bin/splunk restart

#verify - search for ssl and cipher
cat /opt/splunkforwarder/var/log/splunkd.log | grep cipher
	...INFO loader - using cipher suite ALL:!NULL:!LOW:!EXP:RC4+RSA:+HIGH:+MEDIUM

# =================================================================
# =======================Monitor /var/log==========================
# =================================================================

vi /opt/splunkforwarder/etc/apps/search/local/inputs.conf

  # [monitor:///var/log]
  # disabled = false
  # sourcetype = syslog
  # _blacklist = .*\.(gz|zip|bkz|arch|etc)$'  #this rejects any compressed files/logs

/opt/splunkforwarder/bin/splunk restart
/opt/splunkforwarder/bin/splunk list monitor

# =================================================================
# =====================Monitor application logs====================
# =================================================================

mkdir -p /opt/splunkforwarder/etc/apps/search/local
vi /opt/splunkforwarder/etc/apps/search/local/inputs.conf

  # [monitor://<log_Location>]
  # disabled = false
  # sourcetype =
  # _blacklist = .*\.(gz|zip|bkz|arch|etc)$

/opt/splunkforwarder/bin/splunk restart

#################################################################
#								#
#		Splunk Forwarder (Windows)			#
#								#
#################################################################

# Login to windows machine
# double-click Splunkforwarder.msi
# prompt:
# 	click next
# 	accept license
# 	click next
# 	enter <INDEXER_IP> : <PORT>
# 	enter <INDEXER_IP> : <PORT>
# 	click next
# 	click next
# 	Check everything if DC / if not dont click AD Monitoring click next
# 	click install
# 	UAC pop-up - click yes
# 	click finish

# open cmd as administrator

cd C:\Program Files\SplunkUniversal Forwarder\bin
splunk edit user admin -password <NEW_PASSWORD> -role admin -auth admin:changeme
splunk set splunkd-port <MGMT_PORT>
splunk restart

# =================================================================
# =======================Enable SSL Forwarding=====================
# =================================================================

# open notepad as administrator
# open C:\Program Files\SplunkUniversal Forwarder\etc\system\local\outputs
# copy contents of outputs to new notepad and append lines to look like:

# [tcpout]
# defaultGroup = splunkssl

# [tcpout:splunkssl]
# compressed = true
# server = <IPADDR:PORT>  #enter indexer address and port
# sslCertPath = C:\Program Files\SplunkUniversal Forwarder\etc\auth\server.pem
# sslPassword = password #will hash after splunk restart
# sslRootCAPath = C:\Program Files\SplunkUniversal Forwarder\etc\auth\cacert.pem
# sslVerifyServerCert = false

# save to C:\Program Files\SplunkUniversal Forwarder\etc\system\local\outputs

# open cmd as administrator

cd C:\Program Files\SplunkUniversal Forwarder\bin
splunk restart

#verify host shows up in indexer

# =================================================================
# =====================Monitor application logs====================
# =================================================================
# !!!!!!!!!!!!!!!!!!!!!!!!!!!UNTESTED!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# open notepad as administrator
# open C:\Program Files\SplunkUniversal Forwarder\etc\system\local\inputs.conf

# [monitor:///<LOG_DIR>]
# disabled = false
# sourcetype = <SOURCETYPE>
# _blacklist = .*\.(gz|zip|bkz|arch|etc)$'  #this rejects any compressed files/logs

#################################################################
#								#
#				MISC				#
#								#
#################################################################

# =================================================================
# =====================Errors restarting splunk====================
# =================================================================
# Error:
# 	...
# 	Conf is currently being modified by process <PID>
# 	Starting splunk server daemon (splunkd)...
# 	Timed out waiting for splunkd to start.
# 	...

# Solution:
rm -f /opt/splunk/var/run/splunk/*.pid
# OR
rm -f /opt/splunkforwarder/var/run/splunk/*.pid

# =================================================================
# =======================Uninstall from linux======================
# =================================================================

rpm -qa | grep splunk
rpm -e splunk-####.#.# OR rpm -e splunkforwarder-####.#.#
rm -f /etc/init.d/splunk
rm -rf /opt/splunk OR rm -rf /opt/splunkforwarder

# =================================================================
# ====================Receive remote login error===================
# =================================================================

vi /opt/splunkforwarder/etc/system/local/server.conf

  # [general]
  # allowRemoteLogin = always

# =================================================================
# =====================Receive a diskspace error===================
# =================================================================

# Error in splunkweb interface:
# 	diskspace in /opt/splunk/var/run/dispatch full

rm -rf /opt/splunk/var/run/dispatch/*

# OR

# increase minimun space in splunkweb
# 	GoTo Manager > System Settings > General settings
# 	Decrease the "Pause indexing if free disk space (in MB) falls below"

# OR

# Increase the OPT partition size.
