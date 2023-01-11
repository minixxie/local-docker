PULL_THRU_CACHE :=

.PHONY: check
check:
	docker ps -a | grep rabbitmq-3-11-3
	docker ps -a | grep rabbitmq-ui

.PHONY: up
up:
	PULL_THRU_CACHE=${PULL_THRU_CACHE} docker-compose up -d

.PHONY: down
down:
	docker rm -f rabbitmq-3-11-3 rabbitmq-ui

.PHONY: logs
logs:
	docker logs -f rabbitmq-3-11-3

.PHONY: stats
stats:
	docker stats rabbitmq-3-11-3 rabbitmq-ui

.PHONY: cli
cli:
