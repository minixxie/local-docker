SHELL := /bin/bash
DOCKER := nerdctl
COMPOSE := nerdctl compose
CONTAINER := redis-7-0-5

.PHONY: check
check:
	${DOCKER} ps -a | grep ${CONTAINER}

.PHONY: up
up:
	${COMPOSE} up -d

.PHONY: down
down:
	${DOCKER} rm -f ${CONTAINER} || true

.PHONY: logs
logs:
	${DOCKER} logs -f ${CONTAINER}

.PHONY: stats
stats:
	${DOCKER} stats ${CONTAINER}

.PHONY: cli
cli:
	source .env ; ${DOCKER} run --rm -it --net=local "$$PULL_THRU_CACHE"library/redis:7.0.5-alpine3.16 redis-cli -h ${CONTAINER} -p 6379

.PHONY: check-healthy
check-healthy:
	@source .env ; DOCKER=${DOCKER} CONTAINER=${CONTAINER} CONTAINER_CMD="/healthcheck.sh" ../scripts/healthcheck.sh

.PHONY: wait-healthy
wait-healthy:
	@source .env ; DOCKER=${DOCKER} CONTAINER=${CONTAINER} CONTAINER_CMD="/healthcheck.sh" WAIT=1 ../scripts/healthcheck.sh
