#!/bin/bash
docker run -d -p 3306:3306 -v ~/docker/mysql/data:/var/lib/mysql -v ~/docker/mysql/conf:/etc/mysql/conf.d --name mysql -e MYSQL_ROOT_PASSWORD=root mysql
