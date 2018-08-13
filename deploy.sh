#! /bin/bash -v

set -x

export VERSION=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)
docker build --build-arg KUBE_LATEST_VERSION=$VERSION --build-arg VCS_REF=`git rev-parse — short HEAD` --build-arg BUILD_DATE=`date -u +”%Y-%m-%dT%H:%M:%SZ”` --cache-from=app -t app .
docker tag app gofunky/kubernetes:$VERSION
docker tag app gofunky/kubernetes:latest
if [ "${CIRCLE_BRANCH}" == "master" ]; then
  docker login -u $DOCKER_USR -p $DOCKER_PWD
  docker push gofunky/kubernetes:$VERSION
  docker push gofunky/kubernetes:latest
fi
