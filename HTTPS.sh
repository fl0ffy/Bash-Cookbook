
#################################################################
#								#
#			HTTPS					#
#								#
#################################################################

yum -y install httpd http openssl mod_ssl

#Generate keys
#Private key
openssl genrsa -out ca.key 1024
#CSR
openssl req -new -key ca.key -out ca.csr
#self-signed key
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

# (test: open browser and go to HTTPS://localhost/ and accept cert)

# Firewall-----------------------------------------------------------------

iptables -A INPUT -p tcp --dport 443 -j ACCEPT