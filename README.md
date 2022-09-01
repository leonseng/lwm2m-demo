# Lightweight Machine to Machine (LWM2M) Demo

This repository deploys an environment for testing [Lightweight M2M](https://omaspecworks.org/what-is-oma-specworks/iot/lightweight-m2m-lwm2m/) using [Eclipse Leshan](https://github.com/eclipse/leshan).

## Prerequisite

- [Docker Compose CLI plugin](https://docs.docker.com/compose/install/compose-plugin/)

## Instructions

1. Create a directory `.certs`.
1. In the `.certs` directory, generate the following key pairs with the instructions [here](https://github.com/eclipse/leshan/wiki/Credential-files-format):
    | File name | Description |
    | --- | --- |
    | ccert.der | Client certificate with `CN=leshan-client` |
    | cprik.der | Client private key |
    | xcert.der | Server certificate |
    | xprik.der | Server private key with `CN=leshan-server` |
1. Run `docker compose build` to build the L2M2M client and server images.
1. Run `docker compose up` to deploy the following:
    - a Leshan server
    - an endpoint provisioner which configures a secure endpoint on the Leshan server (required for registration via coaps)
    - a Leshan client registering via CoAP (`coap://`)
    - a Leshan client registering via CoAP over DTLS (`coaps://`)
1. Browse to [Leshan server web UI](localhost:8080) and you should see two clients registered.
    ![web-ui](./docs/img/leshan-web.png)