DOCKER := nerdctl
COMPOSE := nerdctl compose

.PHONY: check
check:
	${DOCKER} ps -a | grep kafka_3_3
	${DOCKER} ps -a | grep zookeeper_3_8

.PHONY: up
up:
	${COMPOSE} up -d
	cd ../nginx && make up && cd -

.PHONY: down
down:
	${DOCKER} rm -f kafka_3_3 zookeeper_3_8 kafka_ui || true

.PHONY: logs
logs:
	${DOCKER} logs -f kafka_3_3

.PHONY: stats
stats:
	${DOCKER} stats kafka_3_3 zookeeper_3_8 kafka_ui

.PHONY: cli
cli:
