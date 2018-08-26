#!/bin/bash

curr_dir=$(cd $(dirname $0); pwd)

docker run -it --rm \
  -p 127.0.0.1:8888:8888 \
  -p 127.0.0.1:80:80 \
  -v $curr_dir/tp:/home/jovyan/tp \
  qvm-dev \
  bash
