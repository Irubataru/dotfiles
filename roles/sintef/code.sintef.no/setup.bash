# This is just a transcript of the instructions for getting a user certificate
# necessary to login to code.sintef.no, http://code.sintef.no/request_cert.pdf

# 1. Generate the key you will use to sign the certificate
openssl genrsa -des3 -out code_sintef_no.key 2048

# 2. Generate the sertificate request using the config in this folder
openssl req -new -config code_sintef_no.conf -key code_sintef_no.key -out certreq.txt

# 3.Enroll the certificate
#    - Logon to https://sintefpkica01.sintef.no/certsrv/certrqxt.asp (VPN)
#    - Saved reqest: content of certreq.txt
#    - Certificate template: UserV2
#    - Base64-option
#    - Download certificate chain as certnew.p7b

# 4. Create a PKCS12 that is recognised by most browsers
openssl pkcs7 -inform pem -in certnew.p7b -print_certs -out code_sintef_no.pem 
openssl pkcs12 -export -in code_sintef_no.pem -inkey code_sintef_no.key

# 5. (Optional) Add the certificate to the browser you will be using
#    - Vivaldi: chrome://settings/certificates
