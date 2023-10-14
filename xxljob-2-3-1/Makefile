SHELL := /bin/bash
DOCKER := nerdctl
COMPOSE := nerdctl compose
CONTAINER := xxljob-2-3-1

.PHONY: check
check:
	${DOCKER} ps -a | grep ${CONTAINER}

.PHONY: up
up:
	cd ../mysql-8-0-31 && make up wait-healthy && cd -
	${COMPOSE} up -d
	cd ../nginx && make up && cd -

#@echo "1. Remember to run ./init-db.sh if you haven't!"
#@echo "2. Add entry '127.0.0.1  xxljob.local' into /etc/hosts"
#@echo "3. And then you can visit: http://xxljob.local/xxl-job-admin (user: admin, pass: 123456)"

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
	@DOCKER=${DOCKER} CONTAINER=${CONTAINER} HTTP="http://127.0.0.1:8080/xxl-job-admin" ../scripts/healthcheck.sh

.PHONY: wait-healthy
wait-healthy:
	@DOCKER=${DOCKER} CONTAINER=${CONTAINER} HTTP="http://127.0.0.1:8080/xxl-job-admin" WAIT=1 ../scripts/healthcheck.sh
