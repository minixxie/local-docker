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
