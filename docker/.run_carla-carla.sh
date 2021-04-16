#!/bin/bash

CARLA_VERSION="0.9.10.1"

docker run \
  -it --rm \
  -p 2000-2002:2000-2002 \
  --gpus all \
  --name="carla-carla" \
  carla-carla:${CARLA_VERSION} \
  bash -c "DISPLAY= SDL_VIDEODRIVER=offscreen SDL_HINT_CUDA_DEVICE=0 ./CarlaUE4.sh -opengl"