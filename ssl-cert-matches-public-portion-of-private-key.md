To determine whether the public key in the certificate matches the public portion contained in the private key, view both files, and compare the modulus values with the following instructions:

To view the certificate:

`openssl x509 -noout -text -in certfile`

To view the key:

`openssl rsa -noout -text -in keyfile`

The "modulus" and "public exponent" portions in the key and the certificate must match exactly.

If the modulus in the two files do not match, the installation will fail.

https://knowledge.digicert.com/solution/SO17751.html
