#!/bin/sh
DOCKER_IP="$(ip a s docker0 | grep 'inet ' | cut -'d ' -f6 | cut -d'/' -f1)"
export http_proxy="http://${DOCKER_IP}:3142"
export DOCKER_BUILDKIT=1
docker build --build-arg http_proxy -f Dockerfile -t dotfiles .
docker run -e http_proxy --rm -it dotfiles
