#!/bin/bash
docker run -d -p 6379:6379 -v ~/docker/redis/data:/data --name redis redis
