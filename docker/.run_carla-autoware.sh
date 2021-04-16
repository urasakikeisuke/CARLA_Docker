#!/bin/bash

CARLA_VERSION="0.9.10.1"

HOST_SD=$(dirname $(dirname $(readlink -f $0)))/shared_dir

DOCKER_VOLUME="-v ${HOST_SD}:/home/autoware/shared_dir:rw"

sleep 3

clear

printf "\033[01;31m\n";
printf '  _______         _____ \n';
printf '  ___    |____  ____  /_______ ___      ________ ______________ \n';
printf '  __  /| |_  / / /_  __/_  __ \__ | /| / /_  __ `/__  ___/_  _ \ \n';
printf '  _  ___ |/ /_/ / / /_  / /_/ /__ |/ |/ / / /_/ / _  /    /  __/ \n';
printf '  /_/  |_|\__,_/  \__/  \____/ ____/|__/  \__,_/  /_/     \___/ \n';
printf "\n"
printf "\n"
printf "\033[00m\n"

docker run \
  -it --rm \
  --volume=$(pwd)/autoware-contents:/home/autoware/autoware-contents:ro \
  --env="DISPLAY=${DISPLAY}" \
  --privileged \
  --net=host \
  --gpus all \
  ${DOCKER_VOLUME} \
  --name="carla-autoware" \
  carla-autoware:${CARLA_VERSION}-autoware1.14.0 \