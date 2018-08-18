#!/bin/bash

docker run -m 1024m --cpus='1' -d -p 5005:5005 \
       -v ~/dotfiles/.docker/ripple/dev/rippled.cfg:/etc/ripple/rippled.cfg \
       -v ~/dotfiles/.docker/ripple/dev/validators.txt:/etc/ripple/validators.txt \
       --name dev-rippled rippled

