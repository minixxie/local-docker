SHELL := /bin/bash
DOCKER := nerdctl
COMPOSE := nerdctl compose
CONTAINER := gitea-1-18-3

.PHONY: check
check:
	${DOCKER} ps -a | grep ${CONTAINER}

.PHONY: up
up:
	cd ../gitea-db && make up wait-healthy && cd -
	${COMPOSE} up -d
	make wait-healthy
	cd ../nginx && make up && cd -

.PHONY: down
down:
	${DOCKER} rm -f ${CONTAINER} || true

.PHONY: logs
logs:
	${DOCKER} logs -f ${CONTAINER}

.PHONY: stats
stats:
	${DOCKER} stats $$(${COMPOSE} ps | sed 1d | awk '{print $$1}')

.PHONY: check-healthy
check-healthy:
	@DOCKER=${DOCKER} CONTAINER=${CONTAINER} HTTP="http://127.0.0.1:3000" ../scripts/healthcheck.sh

.PHONY: wait-healthy
wait-healthy:
	@DOCKER=${DOCKER} CONTAINER=${CONTAINER} HTTP="http://127.0.0.1:3000" WAIT=1 ../scripts/healthcheck.sh
