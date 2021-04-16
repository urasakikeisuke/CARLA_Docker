#!/bin/bash

gnome-terminal \
  --tab --title "CARLA Server" --command "./.run_carla-carla.sh" \
  --tab --command "./.run_carla-autoware.sh"

gnome-terminal \
  --tab --command "./.exec_carla-autoware.sh"

gnome-terminal \
  --tab --command "./.run_carla-pyapi.sh"

gnome-terminal \
  --tab --command "./.exec_carla-pyapi.sh" \
  --tab --command "./.exec_carla-pyapi.sh"