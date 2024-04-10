#!/bin/bash
# Script to auto generate nzyme-tap config from connected devices on the host

if [ $# -ne 1 ]; then
    echo "No nzyme-tap images tag passed. Example: sh generate_conf_config.sh v2a10"
    exit 1
fi

docker_image_tag=$1
docker_image_name=nzyme-tap

# Check if the image exists
docker images | grep "$docker_image_name" | grep -q "$docker_image_tag"

if [ $? -eq 1 ]; then
    echo "Either image name or tag not found."
    exit 1
fi

docker run --network host --rm $docker_image_name:$docker_image_tag /usr/bin/nzyme-tap --generate-channels

