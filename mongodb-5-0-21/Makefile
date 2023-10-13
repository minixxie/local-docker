SHELL := /bin/bash
DOCKER := nerdctl
COMPOSE := nerdctl compose
CONTAINER := mongodb-5-0-21

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
	source .env ; ${DOCKER} run --rm -it --net local "$$PULL_THRU_CACHE"library/mongo:5.0.21 mongo "mongodb://root:$$MONGODB_ROOT_PASSWORD@mongodb-5-0-21:27017/admin"
