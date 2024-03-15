# ==== Server TLS Cert ====
# Set Gloabl Variables for Server Side certifcate for TLS
export CA_DIR=_ca
export CA_CERT_FILE=$CA_DIR/root-ca.crt CA_KEY_FILE=$CA_DIR/root-ca.key
export SERVER_DIR=_server-tls
export SERVER_SAN="DNS:localhost, DNS:host.docker.internal, IP:127.0.0.1" SERVER_CERT_FILE=$SERVER_DIR/server.crt SERVER_KEY_FILE=$SERVER_DIR/server.key
export SERVER_CN="/CN=localhost/OU=Solutions Engineering/O=MuleSoft France/L=Paris/ST=Paris/C=FR"

# Create server.cnf below
mkdir $SERVER_DIR
echo "[server]" > $SERVER_DIR/server.cnf
echo "authorityKeyIdentifier=keyid,issuer" >> $SERVER_DIR/server.cnf
echo "basicConstraints = critical,CA:FALSE" >> $SERVER_DIR/server.cnf
echo "extendedKeyUsage=serverAuth" >> $SERVER_DIR/server.cnf
echo "keyUsage = critical, digitalSignature, keyEncipherment" >> $SERVER_DIR/server.cnf
echo "subjectAltName = $SERVER_SAN" >> $SERVER_DIR/server.cnf
echo "subjectKeyIdentifier=hash" >> $SERVER_DIR/server.cnf

# Create Server Private Key, Cert Req for TLS
openssl genrsa -out $SERVER_KEY_FILE 4096
openssl req -new -key $SERVER_KEY_FILE -out ${SERVER_CERT_FILE}.csr -sha256 -subj "$SERVER_CN"
# Sign the Server Cert Request by the Root CA and generate the Server Cert
openssl x509 -req -days 750 -in ${SERVER_CERT_FILE}.csr -sha256 -CA $CA_CERT_FILE -CAkey $CA_KEY_FILE -CAcreateserial -outform PEM -out $SERVER_CERT_FILE -extfile "$SERVER_DIR/server.cnf" -extensions server

