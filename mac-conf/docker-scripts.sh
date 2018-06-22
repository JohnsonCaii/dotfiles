#!/bin/bash

run_mysql() {
    docker run -d -p 3306:3306 \
           -v ~/.docker/mysql/data:/var/lib/mysql \
           -v ~/.docker/mysql/conf:/etc/mysql/conf.d \
           --restart=always --name mysql -e MYSQL_ROOT_PASSWORD=root mysql
}

run_rabbitmq() {
    docker run -d --name rabbitmq \
           --publish 5671:5671 \
           --publish 5672:5672 \
           --publish 4369:4369 \
           --publish 25672:25672 \
           --publish 15671:15671 \
           --publish 15672:15672 \
           --hostname rabbit-server \
           --restart=always \
           -v ~/.docker/rabbitmq/data:/var/lib/rabbitmq \
           -v ~/.docker/rabbitmq/conf:/etc/rabbitmq \
           rabbitmq:management
    docker exec rabbitmq rabbitmq-plugins enable rabbitmq_management
}

run_redis() {
    docker run -d -p 6379:6379 \
           -v ~/.docker/redis/data:/data \
           --restart=always --name redis redis
}

run_postgres() {
    docker run --name postgres -p 5432:5432 \
           -e POSTGRES_PASSWORD=root --restart=always -d postgres
}


case $1 in
    mysql)
	    echo "Run mysql"
        run_mysql
	    ;;
    redis)
		echo "Run redis"
        run_redis
	    ;;
	rabbitmq)
	    echo "Run rabbitmq"
        run_rabbitmq
	    ;;
    postgres)
        echo "Run postgres"
        run_postgres
        ;;
    *)
        echo "Run all"
        run_mysql
        run_redis
        run_rabbitmq
        run_postgres
esac
