#!/bin/bash

# 参考：https://docs.docker.com/v1.13/registry/deploying/

# Use unofficial Bash Strict Mode
set -euo pipefail
IFS=$'\n\t'

# import common.sh
CUR_DIR=$(cd $(dirname $0) && pwd)

pushd $CUR_DIR
docker-compose up -d
popd
