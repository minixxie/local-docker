SHELL := /bin/bash
DOCKER := nerdctl
COMPOSE := nerdctl compose
CONTAINER := postgres-ui

.PHONY: check
check:
	${DOCKER} ps -a | grep ${CONTAINER}

.PHONY: up
up:
	cd ../postgres-15-1 && make up wait-healthy && cd -
	${COMPOSE} up -d
	make -s wait-healthy
	cd ../nginx && make up && cd -

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
	@source .env ; DOCKER=${DOCKER} CONTAINER=${CONTAINER} HTTP="http://127.0.0.1:8081" ../scripts/healthcheck.sh

.PHONY: wait-healthy
wait-healthy:
	@source .env ; DOCKER=${DOCKER} CONTAINER=${CONTAINER} HTTP="http://127.0.0.1:8081" WAIT=1 ../scripts/healthcheck.sh
