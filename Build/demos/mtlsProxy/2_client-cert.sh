# ==== Client Cert ====
# Set Gloabl Variables for Client Certificate
export CA_DIR=_ca
export CA_CERT_FILE=$CA_DIR/root-ca.crt CA_KEY_FILE=$CA_DIR/root-ca.key
export CLIENT_DIR=_client-cert
export CLIENTAPP_CERT_FILE=$CLIENT_DIR/example-client.crt CLIENTAPP_KEY_FILE=$CLIENT_DIR/example-client.key
export CLIENTAPP_CN="/CN=client.example.com/OU=Solutions Engineering/O=MuleSoft France/L=Paris/ST=Paris/C=FR"

# Create client.cnf below
mkdir $CLIENT_DIR
echo "[client]" > $CLIENT_DIR/client.cnf
echo "authorityKeyIdentifier=keyid,issuer" >> $CLIENT_DIR/client.cnf
echo "basicConstraints = critical,CA:FALSE" >> $CLIENT_DIR/client.cnf
echo "extendedKeyUsage=clientAuth" >> $CLIENT_DIR/client.cnf
echo "keyUsage = critical, digitalSignature, keyEncipherment" >> $CLIENT_DIR/client.cnf
echo "subjectKeyIdentifier=hash" >> $CLIENT_DIR/client.cnf

# Create Client Private Key and Client Cert Req for authentication
openssl genrsa -out $CLIENTAPP_KEY_FILE 4096
openssl req -new -key $CLIENTAPP_KEY_FILE -out ${CLIENTAPP_CERT_FILE}.csr -sha256 -subj "$CLIENTAPP_CN"
# Sign the Client Cert Request by the Root CA and generate the Client Cert
openssl x509 -req -days 750 -in ${CLIENTAPP_CERT_FILE}.csr -sha256 -CA $CA_CERT_FILE -CAkey $CA_KEY_FILE -CAcreateserial -outform PEM -out $CLIENTAPP_CERT_FILE -extfile "$CLIENT_DIR/client.cnf" -extensions client

