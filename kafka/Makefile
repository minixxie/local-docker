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
	docker rm -f kafka_3_3 zookeeper_3_8 kafka_ui

.PHONY: logs
logs:
	docker logs -f kafka_3_3

.PHONY: stats
stats:
	docker stats kafka_3_3 zookeeper_3_8 kafka_ui

.PHONY: cli
cli:
