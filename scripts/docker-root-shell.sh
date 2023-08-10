#!/usr/bin/env sh
docker exec -it "$(docker ps | grep dotfiles | cut -d' ' -f 1)" bash
