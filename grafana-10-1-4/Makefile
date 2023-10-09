DOCKER := nerdctl
COMPOSE := nerdctl compose
CONTAINER := grafana-10-1-4

.PHONY: check
check:
	${DOCKER} ps -a | grep ${CONTAINER}

.PHONY: up
up:
	${COMPOSE} up -d
	#cd ../nginx-proxy && make up
	cd ../nginx && make up

.PHONY: down
down:
	${DOCKER} rm -f ${CONTAINER} || true

.PHONY: logs
logs:
	${DOCKER} logs -f ${CONTAINER}

.PHONY: stats
stats:
	${DOCKER} stats ${CONTAINER}
