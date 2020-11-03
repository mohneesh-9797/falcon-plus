#!/bin/bash
MODULES=(
    'agent'
    'aggregator'
    'alarm'
    'api'
    'gateway'
    'graph'
    'hbs'
    'judge'
    'nodata'
    'transfer'
)
DOCKER_REGISTRY=registry.cn-hangzhou.aliyuncs.com/mohneesh-9797
VERSION=v0.3

clean() {
    echo "clean..."
    if [ -d "build" ]; then
        rm -rf build/
    fi
    mkdir build
}

build() {
    echo "build source..."
    docker run -it --rm \
        --name build \
        -v "$(pwd)":"/go/src/github.com/mohneesh-9797/falcon-plus" \
        -w "/go/src/github.com/mohneesh-9797/falcon-plus" \
        openfalcon/makegcc-golang:1.10-alpine \
        docker/k8s-cluster/init.sh
}

buildDockerImages() {
    echo "build docker images..."
    for i in "${MODULES[@]}"; do
        echo "build $i"
        awk -v module="$i" '{ gsub(/%%MODULE_NAME%%/, module); print $0 }' docker/k8s-cluster/Dockerfile.tpl > docker/k8s-cluster/Dockerfile
        docker build -f docker/k8s-cluster/Dockerfile -t $DOCKER_REGISTRY/$i:$VERSION .
        rm docker/k8s-cluster/Dockerfile
    done
}

clean
build
buildDockerImages
