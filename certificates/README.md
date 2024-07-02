# Working with Certificates

#### Extract crt from pfx
```bash
keytool pkcs12 -nokeys -in ${INPUT_CERT} -clcerts -out ${CERT_NAME}
```

#### Extract key from pfx
```bash
keytool pkcs12 -in ${INPUT_CERT} -nocerts -nodes -out ${KEY_NAME}
```

#### Add crt to java keystore
```bash
keytool -importkeystore -keystore cacerts -importcert -alias ${CERT_ALIAS} -file cert.crt
```

#### Check crt
```bash
openssl x509 -in cert.crt -noout -text
```

