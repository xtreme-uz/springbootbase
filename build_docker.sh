#!/bin/sh
BASE_IMAGE="springbootbase"
VERSION=$1
if [[ -z "$VERSION" ]]
then
    VERSION="latest"
fi
DOCKER_IMAGE=keaz/${BASE_IMAGE}:${VERSION}
tput setaf 7;
tput bold setaf 1; echo "Create image using ${VERSION} tag"
tput sgr0;
docker build -t ${DOCKER_IMAGE} .

OLD_CONTAINERS=$(docker ps -as | grep ${BASE_IMAGE} | awk {'print $1'})
tput setaf 7;
tput bold setaf 1;
if [[ -z "$OLD_CONTAINERS" ]]
then
   echo "No Containers running"
else
    echo "Removing old containers ${OLD_CONTAINERS}"
    docker rm -f ${OLD_CONTAINERS}
fi
tput sgr0;

tput setaf 7;
tput bold setaf 1; echo "Starting new container ${BASE_IMAGE}"
tput sgr0;
docker run --name=${BASE_IMAGE} ${DOCKER_IMAGE}

exit 0