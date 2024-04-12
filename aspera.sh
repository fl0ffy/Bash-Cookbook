

#################################################################
#								#
#			Aspera					#
#								#
#################################################################

#-----------------------------------------------------------------
#-------------------Aspera Enterprise Server----------------------
#-----------------------------------------------------------------

rpm -ivh aspera-entsrv.rpm
cp <license file> /opt/aspera/etc/aspera-license
ascp -A

useradd ascp1
passwd ascp1 <ascp1>
chown -R ascp1:ascp1 /opt/aspera

vi /home/ascp1/.bashrc
	...
	if [ $(expr index "$-" i) -eq 0 ]; then
		return
	fi
	...

vi /opt/aspera/etc/aspera.conf
	...
	<default>
		<async_activity_logging>true</async_activity_logging>  #if using sync in console
	</default>
	...
	<aaa><realms><realm>
		<users>
			<user>
				<name>ascp1</name>
				<file_system>
					<access>
						<paths><path><absolute> <paths><path><absolute>
					</access>
				</file_system>
			</user>
		</users>
	</realm></realms></aaa>
	...

#/opt/aspera/bin/asperanoded -a -u <username> -p <PASSWORD> -x <TRANSFER_USER>

#Configure logs:
vi /etc/syslog.conf
	...
	local2.info		/var/log/aspera.log
	

service syslog restart

#add as managed node to Aspera console

# -----------------------------------------------------------------
# ------------------------Aspera Proxy-----------------------------
# -----------------------------------------------------------------

rpm -ivh aspera-entsrv.rpm
cp <license file> /opt/aspera/etc/aspera-license
ascp -A

#enable IP forwarding
vi /etc/sysctl.conf
	...
	net.ipv4.ip_forward = 1
	...

sysctl -p #reloads changes

#configure as proxy
vi /opt/aspera/etc/aspera.conf
	...
	</aaa>
	<server>
		<proxy>
			<enabled>true</enabled>
		</proxy>
	</server>
	
	</CONF>

service asperanoded restart

#Configure logs:
vi /etc/syslog.conf
	...
	local2.info		/var/log/aspera.log
	

service syslog restart

#add as unmanaged node to Aspera console

# -----------------------------------------------------------------
# ---------------------Aspera Point 2 Point------------------------
# -----------------------------------------------------------------

rpm -ivh aspera-scp-p2p.rpm
cp <license file> /opt/aspera/etc/aspera-license
ascp -A

vi /home/<ENDUSER>/.bashrc
	...
	if [ $(expr index "$-" i) -eq 0 ]; then
		return
	fi
	...

#Configure logs:
vi /etc/syslog.conf
	...
	local2.info		/var/log/aspera.log
	

service syslog restart

#add as unmanaged node to Aspera console

# -----------------------------------------------------------------
# ------------------------Aspera Console---------------------------
# -----------------------------------------------------------------

#prereq: https and mysql. turn them off prior to install
yum -y install mysql
yum -y install httpd oppenssl mod_ssl

#Setup HTTPS
openssl genrsa -out ca.key 1024
openssl req -new -key ca.key -out ca.csr
openssl x509 -req -days 365 -in ca.csr -signkey ca.key -out ca.crt
cp ca.crt /etc/pki/tls/certs/
cp ca.csr /etc/pki/tls/private/
cp ca.key /etc/pki/tls/private/
vi +/SSLCertificateFile /etc/httpd/conf.d/ssl.conf
	...
	SSLCertificateFile /etc/pki/tls/certs/ca.crt
	...
	SSLCertificateKeyFile /etc/pki/tls/private/ca.key
	...

service httpd restart

#Install and configure aspera console
rpm -ivh aspera-common.rpm
rpm -ivh aspera-console.rpm
cp aspera.Console.######.license /opt/aspera/console/config/
chmod 644 /opt/aspera/console/config/aspera.Console.######.license
umask 0022

# asctl console:setup

# 	Streamlined:	A simple setup with all components running on this computer.
# 	Detailed:	An advanced configuration (e.g. non-standard ports or not all components running on a single server)

# 	Streamlined or detailed setup (s/d)? (current: s)

# 	Console
# 		Choose a login name for the new admin user (recommendation: don't use 'admin' or 'root'): ascpadmin
# 		Enter the email address for ascpadmin: <email>
# 		Enter the password for ascpadmin:
# 			Password: <ADMIN_PASSWORD>
# 			Confirm: <ADMIN_PASSWORD>

# 	MySQL
# 		Please enter a new MySQL root password.
# 			Password: <MYSQL_PASSWORD>
# 			Confirm: <MYSQL_PASSWORD>

# 		MySQL will need to start/restart during configuration. Continue (y/n)? (current: y)

# 	Apache
# 		What hostname or IP address should Apache use to identify itself (in the SSL Certificate)? <CONSOLE_IP>
# 		What Port would you like to run Apache HTTP on? (current: 80)
# 		What Port would you like to run Apache HTTP on? (current: 443)
# 			Key and certificate will be generated in this directory:
# 				/opt/aspera/common/apache/conf

	# ================================== Settings =================================== 

	MySQL
		Enabled:	true
		Port:		4406
	Apache
		Enabled:	true
		Hostname:	<CONSOLE_IP>
		Bind Address:	0.0.0.0
		HTTP Port:	80
		HTTPS Port:	443
	Console
		Enabled:	true
		DB Logger IP:	<CONSOLE_IP>
		Admin name:	ascpadmin
		Admin email:	<email>
		MySQL is local:	true

	Are these settings correct? (y/n/x with x for exit) y
	...
	...	
	...
	Apache needs to be restarted, restart it now (y/n)? (default:y)
	MySQL needs to be restarted, restart it now (y/n)? (default:y)
	Console needs to be restarted, restart it now (y/n)? (default:y)

	Reminders:
	- Apache needs ports 80 and 443 open in firewalls.

#Configure logs:
vi /etc/syslog.conf
	...
	local2.info		/var/log/aspera.log
	

service syslog restart

#Go to browser
HTTPS://<CONSOLE_IP>:443/aspera/console