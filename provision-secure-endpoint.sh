# /usr/bin/env sh

until $(curl -s -X PUT leshan-server:8080/api/security/clients --data '{"endpoint":"leshan-client","tls":{"mode":"x509","details":{}}}'); do
  sleep 1
done

echo "Added secure endpoint to server."