SHELL := /bin/bash
DOCKER := nerdctl
COMPOSE := nerdctl compose
CONTAINER := elasticsearch-oss-7-10-2

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

.PHONY: check-healthy
check-healthy:
	@DOCKER=${DOCKER} CONTAINER=${CONTAINER} HTTP="http://127.0.0.1:9200" ../scripts/healthcheck.sh

.PHONY: wait-healthy
wait-healthy:
	@DOCKER=${DOCKER} CONTAINER=${CONTAINER} HTTP="http://127.0.0.1:9200" WAIT=1 ../scripts/healthcheck.sh
