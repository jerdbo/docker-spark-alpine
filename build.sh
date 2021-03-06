#!/bin/bash

set -e

TAG=2.3.1-hadoop2.7
server=alpine

build() {
    NAME=$1
    IMAGE=jerdbo/$server-spark-$NAME:$TAG
    cd $([ -z "$2" ] && echo "./$NAME" || echo "$2")
    echo '--------------------------' building $IMAGE in $(pwd)
    docker build -t $IMAGE .
    cd -
}

build base
build master
build worker
#build submit
#build java-template template/java
#build python-template template/scala
#build python-template template/python