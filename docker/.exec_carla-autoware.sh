#!/bin/bash

CONTAINER_NAME="carla-autoware"

clear

sleep 5

printf "\033[01;31m\n";
printf '  _______         _____ \n';
printf '  ___    |____  ____  /_______ ___      ________ ______________ \n';
printf '  __  /| |_  / / /_  __/_  __ \__ | /| / /_  __ `/__  ___/_  _ \ \n';
printf '  _  ___ |/ /_/ / / /_  / /_/ /__ |/ |/ / / /_/ / _  /    /  __/ \n';
printf '  /_/  |_|\__,_/  \__/  \____/ ____/|__/  \__,_/  /_/     \___/ \n';
printf "\n"
printf "\n"
printf "\033[00m\n"

docker exec -u autoware -it ${CONTAINER_NAME} /bin/bash