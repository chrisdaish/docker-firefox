#!/bin/bash

if [ $# -gt 0 ]
then
  COMMAND=$1
  if [ "${COMMAND}" != "fresh" ]
  then
    echo "Invalid command. Usage: start.sh {fresh}"
    echo
    echo "    fresh:     Starts a brand new Firefox by deleting the container"
    exit 1
  fi

  if [ "${COMMAND}" == "fresh" ]
  then
    docker rm firefox
  fi
fi

docker run \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /dev/snd:/dev/snd \
  -e uid=$(id -u) \
  -e gid=$(id -g) \
  -e DISPLAY=unix$DISPLAY \
  --name firefox \
  firefox

if [ $? -eq 125 ]
then
  echo "Container already exists... reattaching..."
  echo
  docker start firefox
  docker attach firefox
fi
