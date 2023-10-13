SHELL := /bin/bash
DOCKER := nerdctl
COMPOSE := nerdctl compose

.PHONY: check
check:
	${DOCKER} ps -a | grep rabbitmq-3-11-3
	${DOCKER} ps -a | grep rabbitmq-ui

.PHONY: up
up:
	${COMPOSE} up -d
	cd ../nginx && make up && cd -

.PHONY: down
down:
	${DOCKER} rm -f rabbitmq-3-11-3 rabbitmq-ui || true

.PHONY: logs
logs:
	${DOCKER} logs -f rabbitmq-3-11-3

.PHONY: stats
stats:
	${DOCKER} stats rabbitmq-3-11-3 rabbitmq-ui

.PHONY: cli
cli:
