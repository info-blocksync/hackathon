#!/bin/bash

curr_dir=$(cd $(dirname $0); pwd)

docker run -it --rm \
  -p 127.0.0.1:8888:8888 \
  -p 127.0.0.1:8080:8080 \
  -v $curr_dir/tp:/home/jovyan/tp \
  -u root \
  qvm-dev \
  bash
