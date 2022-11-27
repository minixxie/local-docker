PULL_THRU_CACHE :=

.PHONY: check
check:
	docker ps -a | grep kafka_3_3
	docker ps -a | grep zookeeper_3_8

.PHONY: up
up:
	PULL_THRU_CACHE=${PULL_THRU_CACHE} docker-compose up -d

.PHONY: down
down:
	docker rm -f kafka_3_3 zookeeper_3_8

.PHONY: logs
logs:
	docker logs -f kafka_3_3

.PHONY: stats
stats:
	docker stats kafka_3_3 zookeeper_3_8

.PHONY: cli
cli:
	#docker run --rm -it --net=local_backend ${PULL_THRU_CACHE}library/mysql:8.0.31-oracle mysql -hmysql_8_0_31 -uroot -p${MYSQL_ROOT_PASSWORD}
