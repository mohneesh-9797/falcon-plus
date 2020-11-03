#!/bin/sh

apk add --no-cache ca-certificates git bash \
&& make all \
&& make pack4docker \
&& tar -zxf mohneesh-9797-v*.tar.gz -C build \
&& rm mohneesh-9797-v*.tar.gz