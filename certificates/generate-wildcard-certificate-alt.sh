#!/usr/bin/env bash

#print usage
DOMAIN=$1

if [ -z "$1" ]; then
        echo "USAGE: $0 domain.lan"
        echo ""
        echo "This will generate a non-secure self-signed wildcard certificate for given domain."
        echo "This should only be used in a development environment."
        exit
fi

# Add wildcard
#WILDCARD="*.$DOMAIN"

# Set our CSR variables
SUBJ="
C=US
ST=.
O=.
localityName=.
commonName=$WILDCARD
organizationalUnitName=.
emailAddress=.
"

# Generate our Private Key, CSR and Certificate
openssl genrsa -out "$DOMAIN.key" 4096 
openssl req -new -subj "$(echo -n "$SUBJ" | tr "\n" "/")" -key "$DOMAIN.key" -out "$DOMAIN.csr" -sha256 -utf8 -rand /dev/urandom
openssl x509 -req -days 3650 -in "$DOMAIN.csr" -signkey "$DOMAIN.key" -out "$DOMAIN.crt" -extfile <(printf "subjectAltName=\
	DNS:sonarqube.$DOMAIN,\
	DNS:nexus.$DOMAIN,\
	DNS:gitlab.$DOMAIN,\
	DNS:mattermost.$DOMAIN,\
	DNS:harbor.$DOMAIN,\
	DNS:twistlock.$DOMAIN,\
	DNS:anchore.$DOMAIN,\
	DNS:kibana.$DOMAIN,\
	DNS:argocd.$DOMAIN,\
	DNS:kiali.$DOMAIN,\
	DNS:jaeger.$DOMAIN,\
	DNS:keycloak.$DOMAIN,\
	")