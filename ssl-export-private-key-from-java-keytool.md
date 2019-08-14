Use Java keytool to convert from JKS to P12...
Export from keytool's proprietary format (called "JKS") to standardized format PKCS #12:

```
keytool -importkeystore \
    -srckeystore keystore.jks \
    -destkeystore keystore.p12 \
    -deststoretype PKCS12 \
    -srcalias <jkskeyalias> \
    -deststorepass <password> \
    -destkeypass <password>
```

...then use openssl to export from P12 to PEM

Export certificate using openssl:
`openssl pkcs12 -in keystore.p12  -nokeys -out cert.pem`

Export unencrypted private key:
`openssl pkcs12 -in keystore.p12  -nodes -nocerts -out key.pem`

https://security.stackexchange.com/questions/3779/how-can-i-export-my-private-key-from-a-java-keytool-keystore
