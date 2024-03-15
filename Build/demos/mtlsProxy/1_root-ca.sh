# ==== Root CA ====
# Set Gloabl Variables for Root CA
export CA_DIR=_ca
export CA_CERT_FILE=$CA_DIR/root-ca.crt CA_KEY_FILE=$CA_DIR/root-ca.key CA_DIR=$CA_DIR
export CA_CN="/CN=SE French Team CA/OU=Solutions Engineering/O=MuleSoft France/L=Paris/ST=Paris/C=FR"

# Create root-ca.cnf below
mkdir $CA_DIR
echo "[root_ca]" > $CA_DIR/root-ca.cnf
echo "basicConstraints = critical,CA:TRUE,pathlen:1" >> $CA_DIR/root-ca.cnf
echo "keyUsage = critical, nonRepudiation, cRLSign, keyCertSign" >> $CA_DIR/root-ca.cnf
echo "subjectKeyIdentifier=hash" >> $CA_DIR/root-ca.cnf

# Create Root CA Private Key, Root CA Cert Request
openssl genrsa -out $CA_KEY_FILE 4096
openssl req -new -key $CA_KEY_FILE -out ${CA_CERT_FILE}.csr -sha256 -subj "$CA_CN"
# Sign the Root CA Cert Request by the Root CA and generate the CA Cert
openssl x509 -req -days 3650 -in ${CA_CERT_FILE}.csr -signkey $CA_KEY_FILE -outform PEM -out $CA_CERT_FILE -extfile "$CA_DIR/root-ca.cnf" -extensions root_ca

