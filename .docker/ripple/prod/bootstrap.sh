#!/bin/bash

docker run -m 2048m --cpus='2' -d -p 5006:5006 \
       -v ~/dotfiles/.docker/ripple/prod/rippled.cfg:/etc/ripple/rippled.cfg \
       -v ~/dotfiles/.docker/ripple/prod/validators.txt:/etc/ripple/validators.txt \
       --name prod-rippled rippled

