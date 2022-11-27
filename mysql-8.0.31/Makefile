PULL_THRU_CACHE :=
MYSQL_ROOT_PASSWORD := hello123

.PHONY: check
check:
	docker ps -a | grep mysql_8_0_31

.PHONY: up
up:
	MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} docker-compose up -d

.PHONY: down
down:
	docker rm -f mysql_8_0_31

.PHONY: logs
logs:
	docker logs -f mysql_8_0_31

.PHONY: stats
stats:
	docker stats mysql_8_0_31

.PHONY: cli
cli:
	docker run --rm -it --net=local_backend ${PULL_THRU_CACHE}library/mysql:8.0.31-oracle mysql -hmysql_8_0_31 -uroot -p${MYSQL_ROOT_PASSWORD}
