#!/bin/bash

# 参考：https://docs.docker.com/v1.13/registry/deploying/

# Use unofficial Bash Strict Mode
set -euo pipefail
IFS=$'\n\t'

# import common.sh
CUR_DIR=$(cd $(dirname $0) && pwd)

docker run -d -p 5000:5000 --restart=always --name registry \
  -v $CUR_DIR/data:/var/lib/registry \
  -v $CUR_DIR/certs:/certs \
  -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/all-le.crt \
  -e REGISTRY_HTTP_TLS_KEY=/certs/all-le.key \
  -v $CUR_DIR/auth:/auth \
  -e "REGISTRY_AUTH=htpasswd" \
  -e "REGISTRY_AUTH_HTPASSWD_REALM=Registry Realm" \
  -e REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd \
  registry:2
