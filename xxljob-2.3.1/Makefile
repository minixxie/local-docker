DOCKER := nerdctl
COMPOSE := nerdctl compose
CONTAINER := xxljob-2-3-1

.PHONY: check
check:
	${DOCKER} ps -a | grep ${CONTAINER}

.PHONY: up
up:
	${COMPOSE} up -d
	@echo "1. Remember to run ./init-db.sh if you haven't!"
	@echo "2. Add entry '127.0.0.1  xxljob.local' into /etc/hosts"
	@echo "3. And then you can visit: http://xxljob.local/xxl-job-admin (user: admin, pass: 123456)"

.PHONY: down
down:
	${DOCKER} rm -f ${CONTAINER} || true

.PHONY: logs
logs:
	${DOCKER} logs -f ${CONTAINER}

.PHONY: stats
stats:
	${DOCKER} stats ${CONTAINER}
