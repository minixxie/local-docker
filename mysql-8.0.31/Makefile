DOCKER := nerdctl
COMPOSE := nerdctl compose
CONTAINER := mysql-8-0-31

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
	source .env ; ${DOCKER} run --rm -it --net=local "$$PULL_THRU_CACHE"library/mysql:8.0.31-oracle mysql -A --default-character-set=utf8 -hmysql-8-0-31 -uroot -p"$$MYSQL_ROOT_PASSWORD"
