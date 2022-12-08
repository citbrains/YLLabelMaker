#!/bin/bash
DOCKER_IMAGE="labelmaker:latest"

xhost +
docker run -it --rm --privileged \
    -u `id -u`:`id -g` \
    -e DISPLAY=$DISPLAY \
    -e QT_X11_NO_MITSHM=1 \
    --name labelmaker \
    --device /dev/dri \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -v $PWD/label_image:/YLLabelMaker/label_image:rw \
    $DOCKER_IMAGE 
