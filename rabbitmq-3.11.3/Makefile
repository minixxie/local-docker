PULL_THRU_CACHE :=

.PHONY: check
check:
	docker ps -a | grep rabbitmq_3_11_3

.PHONY: up
up:
	PULL_THRU_CACHE=${PULL_THRU_CACHE} docker-compose up -d

.PHONY: down
down:
	docker rm -f rabbitmq_3_11_3 rabbitmq_ui

.PHONY: logs
logs:
	docker logs -f rabbitmq_3_11_3

.PHONY: stats
stats:
	docker stats rabbitmq_3_11_3 rabbitmq_ui

.PHONY: cli
cli:
