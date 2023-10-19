SHELL := /bin/bash
DOCKER ?= nerdctl
COMPOSE ?= ${DOCKER} compose

.PHONY: name
name:
	@basename $$(PWD)

.PHONY: ps
ps:
	${DOCKER} ps -a | grep $$(make -s name) || true

.PHONY: psa
psa:
	${DOCKER} ps -a

.PHONY: check
check: check
	${DOCKER} ps -a | grep $$(make -s name)

.PHONY: up
up:
	@if [ -f up.rc ]; then DOCKER="${DOCKER}" COMPOSE="${COMPOSE}" source up.rc; else ${COMPOSE} up -d; fi

.PHONY: up-if-down
up-if-down:
	make -s check; if [ $$? -ne 0 ]; then make -s up; fi

.PHONY: down
down:
	${DOCKER} rm -f $$(make -s name) > /dev/null 2>&1 || true

.PHONY: logs
logs:
	${DOCKER} logs -f $$(make -s name)

.PHONY: stats
stats:
	${DOCKER} stats $$(make -s name)

.PHONY: cli
cli:
	@if [ -f cli.rc ]; then DOCKER="${DOCKER}" COMPOSE="${COMPOSE}" CONTAINER="$$(make -s name)" source cli.rc; fi

.PHONY: check-healthy
check-healthy:
	@if [ -f ./healthcheck.rc ]; then \
		source ./healthcheck.rc; \
		source ./.env; \
		DOCKER="${DOCKER}" CONTAINER=$$(make -s name) \
			CONTAINER_CMD="$$CONTAINER_CMD" HTTP="$$HTTP" TCP="$$TCP" \
			../scripts/healthcheck.sh; \
	fi

.PHONY: wait-healthy
wait-healthy:
	@if [ -f ./healthcheck.rc ]; then \
		source ./healthcheck.rc; \
		source ./.env; \
		DOCKER="${DOCKER}" CONTAINER=$$(make -s name) \
			CONTAINER_CMD="$$CONTAINER_CMD" HTTP="$$HTTP" TCP="$$TCP" \
			WAIT=1 \
			../scripts/healthcheck.sh; \
	fi
