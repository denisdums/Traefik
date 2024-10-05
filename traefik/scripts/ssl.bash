#!/bin/sh

mkdir -p ./traefik/certs

mkcert -install && mkcert -cert-file ./traefik/certs/local-cert.pem -key-file ./traefik/certs/local-key.pem "docker.localhost" "*.docker.localhost"