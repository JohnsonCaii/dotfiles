#!/bin/bash
docker run -d --name rabbitmq \
    --publish 5671:5671 \
    --publish 5672:5672 \
    --publish 4369:4369 \
    --publish 25672:25672 \
    --publish 15671:15671 \
    --publish 15672:15672 \
    --hostname rabbit-server \
    --restart=always \
    -v ~/docker/rabbitmq/data:/var/lib/rabbitmq \
    -v ~/docker/rabbitmq/conf:/etc/rabbitmq \
    rabbitmq:management
