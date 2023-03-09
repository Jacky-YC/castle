#!/usr/bin/env bash

set -u -ex -o pipefail

npm config set registry https://registry.npm.taobao.org/
npm install
npm run build

HUB_URL=17600037713
# HARBOR_USERNAME=<HARBOR_USERNAME>
# HARBOR_PASSWD=<HARBOR_PASSWD>

FULL_IMAGE_NAME=$HUB_URL/castle

# docker login -u $HARBOR_USERNAME -p $HARBOR_PASSWD $HUB_URL
docker build -t $FULL_IMAGE_NAME \
--label TIME=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
.

docker push $FULL_IMAGE_NAME
docker rmi $FULL_IMAGE_NAME
