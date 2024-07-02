#!/bin/sh

# requires csrconfig.txt

SUBJ="dso"
DOMAIN="net.local"

openssl genpkey -outform PEM -algorithm RSA -pkeyopt rsa_keygen_bits:4096 -out $SUBJ.$DOMAIN.key
openssl req -new -nodes -key $SUBJ.$DOMAIN.key -config csrconfig.txt -nameopt utf8 -utf8 -days 1095 -out $SUBJ.$DOMAIN.csr
