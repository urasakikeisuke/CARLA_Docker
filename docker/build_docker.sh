#!/bin/bash

BUILD_DIR=$(dirname $(readlink -f $0))

CARLA_VERSION="0.9.10.1"
AUTOWARE_VERSION="1.14.0"

TMP_LIST=(${CARLA_VERSION//./ })
CARLA_EGG_VERSION="${TMP_LIST[0]}.${TMP_LIST[1]}.${TMP_LIST[2]}"

docker pull carlasim/carla:${CARLA_VERSION}

docker build \
    -t carla-pyapi:${CARLA_VERSION} \
    -f ${BUILD_DIR}/src/Dockerfile.pyapi \
    --build-arg CARLA_VERSION="${CARLA_VERSION}" \
    --build-arg CARLA_EGG_VERSION="${CARLA_EGG_VERSION}" ${BUILD_DIR} \
    --add-host="archive.ubuntu.com:160.26.2.187"

docker build \
    -t carla-autoware:${CARLA_VERSION}-autoware${AUTOWARE_VERSION} \
    -f ${BUILD_DIR}/src/Dockerfile.autoware \
    --add-host="archive.ubuntu.com:160.26.2.187" \
    ${BUILD_DIR}

if [[ $? != 0 ]]; then
    echo "エラーにより中断しました．"
    exit 1
fi

DOCKER_IMAGES=$(docker image ls carlasim/carla)
DOCKER_IMAGES_ARY=($(echo ${DOCKER_IMAGES}))

docker tag ${DOCKER_IMAGES_ARY[8]} carla-carla:${CARLA_VERSION}
docker rmi carlasim/carla:${CARLA_VERSION}