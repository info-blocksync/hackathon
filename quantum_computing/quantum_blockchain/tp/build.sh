#!/bin/bash

curr_dir=$(cd $(dirname $0); pwd)

DEBUG=${DEBUG:-"false"}
build_cmd="docker build "

if [ "$DEBUG" != "true" ] ; then
  build_cmd="docker build --no-cache"
fi

# Build base dev image with the correct non-pivileged UID user
$build_cmd \
  --rm \
  -t qvm-dev \
  --build-arg QTUM_UID=$(id -u $USER) \
  --file Dockerfile \
  .
