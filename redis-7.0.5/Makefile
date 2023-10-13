SHELL := /bin/bash
DOCKER := nerdctl
COMPOSE := nerdctl compose

.PHONY: check
check:
	${DOCKER} ps -a | grep redis-7-0-5

.PHONY: up
up:
	${COMPOSE} up -d

.PHONY: down
down:
	${DOCKER} rm -f redis-7-0-5 || true

.PHONY: logs
logs:
	${DOCKER} logs -f redis-7-0-5

.PHONY: stats
stats:
	${DOCKER} stats redis-7-0-5

.PHONY: cli
cli:
	source .env ; ${DOCKER} run --rm -it --net=local "$$PULL_THRU_CACHE"library/redis:7.0.5-alpine3.16 redis-cli -h redis-7-0-5 -p 6379
