#!/bin/bash

CARLA_VERSION="0.9.10.1"

clear

printf "\033[01;31m\n";
printf '________          _______ ________ ________\n';
printf '___  __ \_____  _____    |___  __ \____  _/\n';
printf '__  /_/ /__  / / /__  /| |__  /_/ / __  /  \n';
printf '_  ____/ _  /_/ / _  ___ |_  ____/ __/ /   \n';
printf '/_/      _\__, /  /_/  |_|/_/      /___/   \n';
printf '         /____/                            \n';
printf "\n"
printf "\n"
printf "\033[00m\033[33m\n"
printf "WARNING: You are running this container as root, which can cause new files in\n"
printf "mounted volumes to be created as the root user on your host machine.\n"
printf "\033[00m\n"

docker run \
  -it --rm \
  --env="DISPLAY=${DISPLAY}" \
  --privileged \
  --net=host \
  --gpus all \
  --name="carla-pyapi" \
  carla-pyapi:${CARLA_VERSION} \
  bash -c "cd /root/carla/PythonAPI/examples && bash"