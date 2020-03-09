#!/bin/sh
set -eu

DOCKER_REPOSITORY="explorviz/eaas-base"

if [ "$#" -ne 0 ]; then
    echo "Usage: $0" >&2
    exit 1
fi

build_image() {
    variant="$1"
    image="$DOCKER_REPOSITORY:$variant"
    dockerfile="docker/$variant.Dockerfile"

    if [ ! -f "$dockerfile" ]; then
        echo "Dockerfile $dockerfile missing" >&2
        exit 2
    fi

    echo "Building image $image from $dockerfile"
    docker build -t "$image" -f "$dockerfile" .
}

build_image 11-jre-alpine
build_image 11-jre-debian
build_image 8-jre-alpine
build_image 8-jre-debian
