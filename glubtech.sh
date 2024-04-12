

#################################################################
#								#
#			Glubtech				#
#								#
#################################################################

#install Glubtech
chmod +x ftpswrap.bin
./ftpswrap.bin

#Configure glubtech
cd /usr/local/ftpswrap
chmod 755 *.sh
./config.sh

	# Running Secure FTP Wrapper configuration.
	# Glub Tech Secure FTP Wrapper v#.#.#
	# Copyright (C) 1999-2009 Glub Tech, Inc.

	# 0. Display server information
	# 1. Create a new server
	# 2. Edit an existing server
	# 3. Delete an existing server
	# 4. Manage SSL certificates.
	# 5. Exit

	# Please enter a choice (0 - 5): 1
	# Enter the server's name [localhost.domain]:
	# Enter the licensing code []: <LICENSE_CODE>
	# Enter the IP address of this wrapper [IP]:<LOCALHOST_IP>
	# Enter the IP address of the FTP server [IP]:<FTP_SERVER_IP>**
	# 	-Enter the FTP server's port [21]:
	# Do you want to enable implicit SSL support? [n]:
	# Do you want to enable explicit SSL support? [y]:
	# 	-Enter the port to run on [990]: <PORT>***
	# Are you behind a firewall? [n]:
	# Always encrypt control/command channel during login? [y]:
	# Encrypt dat channel? [y|n|a] [y]:
	# Set advanced options? [n]:


#**This should be the end user IP (FTP server) in order for glubtech to emulate a proxy.
#***This is the incoming port which is directed to the FTP server IP.

#repeat to add additional paths

#Start Glubtech
./ftpswrap.sh start

