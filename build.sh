#!/bin/sh

docker build --rm --pull --tag sway-themes --file ./Dockerfile .
docker run -ti --rm --volume "${PWD}"/themes:/themes sway-themes
sudo chown "${USER}:${USER}" .
