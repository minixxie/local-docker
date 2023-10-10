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
	@DOCKER=${DOCKER} CONTAINER=${CONTAINER} CONTAINER_CMD="/healthcheck -tcp 127.0.0.1:4317" ../scripts/check-healthy.sh

.PHONY: wait-healthy
wait-healthy:
	@DOCKER=${DOCKER} CONTAINER=${CONTAINER} CONTAINER_CMD="/healthcheck -tcp 127.0.0.1:4317" ../scripts/wait-healthy.sh
