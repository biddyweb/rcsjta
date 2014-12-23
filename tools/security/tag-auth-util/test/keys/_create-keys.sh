#!/bin/sh
#DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#cd $DIR

# remove existing keys
rm -f range* package* com*
rm -f *standalone*

# create package signer cert and key.
echo "create package signer cert and key"
echo "1 -"
keytool -genkey -keyalg RSA -alias package-signer -keystore package-signer.jks -storepass secret -keypass secret -dname CN=package-signer-ext -validity 360 -keysize 2048
echo "2 -"
keytool -list -keystore package-signer.jks -storepass secret | grep fingerprint

# create and export range-owner root cert and key.
echo "create and export range-owner root cert and key"
echo "1 -"
keytool -genkey -keyalg RSA -alias range-root -keystore range-root.jks -storepass secret -keypass secret -dname CN=mcc099.mnc099 -ext 'SAN=URI:urn:urn-7:3gpp-application.ims.iari.rcs.mnc099.mcc099.*' -validity 360 -keysize 2048
echo "2 -"
keytool -importkeystore -srckeystore range-root.jks -destkeystore range-root.p12 -deststoretype PKCS12 -srcstorepass secret -storepass secret
echo "3 -"
openssl pkcs12 -in range-root.p12 -out range-root.pem -nodes -passin pass:secret
echo "4 -"
openssl pkcs12 -in range-root.p12 -out range-root.cert -nokeys -passin pass:secret
echo "5 -"
keytool -importcert -keystore range-root-truststore.jks -file range-root.cert -alias range-root -noprompt -storepass secret -keypass secret
echo "6 -"
keytool -importkeystore -srckeystore range-root-truststore.jks -destkeystore range-root-truststore.bks -srcstoretype JKS -deststoretype BKS -srcstorepass secret -deststorepass secret -provider org.bouncycastle.jce.provider.BouncyCastleProvider -providerpath ../../libs/bcprov-jdk15on-150.jar
#keytool -list -keystore range-root.jks -storepass secret -keypass secret -v

# create entity key for specific range iari.
echo "create entity cert for specific range iari"
keytool -genkey -keyalg RSA -alias com.gsma.iariauth.sample -keystore com.gsma.iariauth.sample.jks -storepass secret -keypass secret -dname CN=iari.range.test -keysize 2048
#keytool -list -keystore com.gsma.iariauth.sample.jks -storepass secret -keypass secret -v

# create csr for entity cert.
echo "create csr for entity cert"
keytool -certreq -keyalg RSA -alias com.gsma.iariauth.sample -keystore com.gsma.iariauth.sample.jks -storepass secret -keypass secret -dname CN=iari.range.test -file com.gsma.iariauth.sample.csr

# sign entity cert using range cert
echo "sign entity cert using range cert"
openssl x509 -req -CA range-root.pem -CAkey range-root.pem -in com.gsma.iariauth.sample.csr -out com.gsma.iariauth.sample.cert -days 365 -CAcreateserial -extfile _iarilist-range.ext
#openssl x509 -req -CA range-root.pem -CAkey range-root.pem -in com.gsma.iariauth.sample.csr -out com.gsma.iariauth.sample.cert -days 365 -CAcreateserial -extfile _iarilist-stdalone.ext

# import root cert into keystore
echo "import root cert into keystore"
keytool -importcert -keystore com.gsma.iariauth.sample.jks -file range-root.cert -alias range-root -noprompt -storepass secret -keypass secret

# import entity cert into keystore
echo "import entity cert into keystore"
keytool -importcert -keystore com.gsma.iariauth.sample.jks -file com.gsma.iariauth.sample.cert -alias com.gsma.iariauth.sample -storepass secret -keypass secret