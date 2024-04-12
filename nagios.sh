
#################################################################
# 								#
# 		Nagios install(Ubuntu)	 			#
# 								#
#################################################################

#=================================================================
#=======================install apache============================
#=================================================================

sudo apt-get install apache2 apache2-utils wget build-essential php5-gd libgd2-xpm-dev libapache2-mod-php5

#================================================================
#=================Setup Nagios user and group====================
#================================================================

sudo useradd nagios
sudo groupadd nagcmd
sudo usermod -aG nagcmd nagios

#=================================================================
#==============move nagios tarballs to home dir===================
#=================================================================

# scp nagios* 

#=================================================================
#====================install nagios core==========================
#=================================================================

mkdir tmp && cd tmp
tar zxvf ../nagios-4.0.8.tar.gz 
cd nagios-4.0.8/
./configure --with-nagios-group=nagios --with-command-group=nagcmd --with-mail=/usr/bin/sendmail
make all
sudo make install
sudo make install-init
sudo make install-config
sudo make install-commandmode
sudo mkdir -p /etc/httpd/conf.d
sudo make install-webconf
sudo mv /etc/httpd/conf.d/*.conf /etc/apache2/sites-available
cd /etc/apache2/sites-available
sudo a2ensite nagios.conf
sudo service apache2 reload
cd ~/tmp/nagios-4.0.8/
sudo cp -R contrib/eventhandlers/ /usr/local/nagios/libexec && sudo chown -R nagios:nagios /usr/local/nagios/libexec/eventhandlers
sudo /usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg 
sudo /etc/init.d/nagios start
sudo service apache2 stop

#=================================================================
#================setup Web UI username/password===================
#=================================================================

sudo htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin

#=================================================================
#==================install nagios-plugins=========================
#=================================================================

cd tmp
tar zxvf ../nagios-plugins-2.0.3.tar.gz 
cd nagios-plugins-2.0.3/
./configure --with-nagios-user=nagios --with-nagios-group=nagios
make
sudo make install
sudo ln -s /etc/init.d/nagios /etc/rcS.d/S99nagios
cd /etc/apache2/mods-available
sudo a2enmod cgi
sudo a2enmod cgid
sudo service apache2 start

#=================================================================
#========================go to webUI==============================
#=================================================================

#http://host/nagios

#login with credentials
