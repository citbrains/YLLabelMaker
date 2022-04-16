#!/bin/bash
DOCKER_IMAGE="labelmaker:latest"

id=${1:-"1"}

gpu="--gpus=all"
if ! command -v nvidia-smi &> /dev/null
then
    echo "NVIDIA Driver not be found"
    gpu=""
fi

xhost +
docker run $gpu -it --rm --privileged \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -u `id -u`:`id -g` \
    -e QT_X11_NO_MITSHM=1 \
    --name labelmaker \
    --device /dev/dri \
    -v $PWD/label_image:/YLLabelMaker/label_image:rw \
    $DOCKER_IMAGE 
