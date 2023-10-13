SHELL := /bin/bash
DOCKER := nerdctl
COMPOSE := nerdctl compose
CONTAINER := otel-collector-0-86-0

.PHONY: check
check:
	${DOCKER} ps -a | grep ${CONTAINER}

.PHONY: up
up:
	cd ../jaeger-all-in-one && make up
	#cd ../zipkin-all-in-one && make up
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
	@DOCKER=${DOCKER} CONTAINER=${CONTAINER} TCP="127.0.0.1:4317" ../scripts/healthcheck.sh

.PHONY: wait-healthy
wait-healthy:
	@DOCKER=${DOCKER} CONTAINER=${CONTAINER} TCP="127.0.0.1:4317" WAIT=1 ../scripts/healthcheck.sh
