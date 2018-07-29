#!/bin/bash

docker run -m 512m --cpus='1' -d -p 5005:5005 \
       -v ~/dotfiles/.docker/ripple/rippled.cfg:/etc/ripple/rippled.cfg \
       -v ~/dotfiles/.docker/ripple/validators.txt:/etc/ripple/validators.txt \
       --name rippled rippled

