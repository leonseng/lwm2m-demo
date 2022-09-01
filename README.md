# Lightweight Machine to Machine (LWM2M) Demo

This repository deploys an environment for testing [Lightweight M2M](https://omaspecworks.org/what-is-oma-specworks/iot/lightweight-m2m-lwm2m/) using [Eclipse Leshan](https://github.com/eclipse/leshan).

![deployment](./docs/img/lwm2m-demo.excalidraw.png)

## Prerequisite

- [Docker Compose CLI plugin](https://docs.docker.com/compose/install/compose-plugin/)

## Instructions

Run the following commands to generate x509 private keys and self-signed certificates in DER format for both client and server (based on instructions [here](https://github.com/eclipse/leshan/wiki/Credential-files-format#using-openssl-to-create-self-signed-certificat)) in the `.certs` directory:
```
mkdir .certs

# server private key and cert with CN=leshan-server
openssl ecparam -out .certs/xprik.pem -name prime256v1 -genkey
openssl pkcs8 -topk8 -inform PEM -outform DER -in .certs/xprik.pem -out .certs/xprik.der -nocrypt
openssl req -x509 -new -key .certs/xprik.pem -sha256 -days 36500 \
                    -subj '/CN=leshan-server' \
                    -outform DER -out .certs/xcert.der

# client private key and cert with CN=leshan-client
openssl ecparam -out .certs/cprik.pem -name prime256v1 -genkey
openssl pkcs8 -topk8 -inform PEM -outform DER -in .certs/cprik.pem -out .certs/cprik.der -nocrypt
openssl req -x509 -new -key .certs/cprik.pem -sha256 -days 36500 \
                    -subj '/CN=leshan-client' \
                    -outform DER -out .certs/ccert.der
```

Build the L2M2M client and server images:
```
docker compose build
```

Deploy the environment which contains the following:
- a Leshan server
- a Leshan client registering via CoAP (`coap://`)
- an endpoint provisioner which configures `leshan-client` as a secure x509 endpoint on the Leshan server (required for registration via CoAP over DTLS)
- a Leshan client registering via CoAP over DTLS (`coaps://`)

```
docker compose up
```

Lastly, browse to [Leshan server web UI](http://localhost:8080) and you should see two clients registered.
![web-ui](./docs/img/leshan-web.png)
