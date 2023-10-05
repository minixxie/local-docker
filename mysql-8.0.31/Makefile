PULL_THRU_CACHE :=
CONTAINER := mysql-8-0-31
MYSQL_ROOT_PASSWORD := hello123

.PHONY: check
check:
	docker ps -a | grep ${CONTAINER}

.PHONY: up
up:
	MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} PULL_THRU_CACHE=${PULL_THRU_CACHE} docker-compose up -d

.PHONY: down
down:
	docker rm -f ${CONTAINER}

.PHONY: logs
logs:
	docker logs -f ${CONTAINER}

.PHONY: stats
stats:
	docker stats ${CONTAINER}

.PHONY: cli
cli:
	docker run --rm -it --net=local_network ${PULL_THRU_CACHE}library/mysql:8.0.31-oracle mysql -A --default-character-set=utf8 -hmysql-8-0-31 -uroot -p${MYSQL_ROOT_PASSWORD}
