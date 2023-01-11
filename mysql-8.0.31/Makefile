PULL_THRU_CACHE :=
MYSQL_ROOT_PASSWORD := hello123

.PHONY: check
check:
	docker ps -a | grep mysql-8-0-31

.PHONY: up
up:
	MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} PULL_THRU_CACHE=${PULL_THRU_CACHE} docker-compose up -d

.PHONY: down
down:
	docker rm -f mysql-8-0-31

.PHONY: logs
logs:
	docker logs -f mysql-8-0-31

.PHONY: stats
stats:
	docker stats mysql-8-0-31

.PHONY: cli
cli:
	docker run --rm -it --net=local_backend ${PULL_THRU_CACHE}library/mysql:8.0.31-oracle mysql -A --default-character-set=utf8 -hmysql-8-0-31 -uroot -p${MYSQL_ROOT_PASSWORD}
