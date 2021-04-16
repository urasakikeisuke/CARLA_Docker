# CARLA_Docker
CARLA・ROS bridgeを含むcarla-autoware・Python APIのDockerイメージの作成とコンテナの起動を一括に行うためのスクリプト群

## Requirements

- Docker (19.03+)
- Nvidia docker (https://github.com/NVIDIA/nvidia-docker)

## Setup

```sh
# Clone this repo
git clone http://git-docker.tasakilab:5050/urasaki/CARLA_Docker.git
# Build docker
./CARLA_Docker/docker/build_docker.sh
```

## Run docker

```sh
cd ./CARLA_Docker/docker
./run_docker.sh
```

This will start some interactive shells inside the container. 

**To start the CARLA autoware agent, run the following command on autoware shell:**
```sh
carla_autoware town:=Town01
```

**To start the autoware, run the following command on autoware shell:**
```sh
autoware
```

**To spawn NPCs, run the following command on the first pyapi shell:**
```sh
python spawn_npc.py -n 30
```

**To change the environment (e.g. weather), run the following command on the second pyapi shell:**
```sh
python environment.py --weather clear
```
