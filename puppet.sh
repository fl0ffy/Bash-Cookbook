vi /etc/ssh/sshd_config
	# ...
	# PermitRootLogin yes
	# ...

service sshd restart

hostname  #Must be FQDN
	#enter FQDN as first entry in /etc/hosts

#ports 443 and 3000 required open

#use answers file for installation (will error if missing answer)
./puppet-enterprise-installer -a answers.file
#use answers file for installation (will ask if missing answer)
./puppet-enterprise-installer -A answers.file
#install puppet 
./puppet-enterprise-installer
	Y

#==> goto: http://<hostname>:3000 to complete;;ppp    installation

#answers file generated at /opt/puppet/share/installer/answers/<HOSTNAME>.answers

#==> goto: https://<hostname>/cas/login to login to web console

##################################################################
#install agent on node
########################################

curl -k https://<hostname>:8140/packages/current/install.bash | bash

puppet agent -t

#goto master:
puppet cert list
puppet cert sign <certname>
# OR
puppet cert sign all
 #goto node:
puppet agent -t
puppet agent



