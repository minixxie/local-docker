SHELL := /bin/bash
DOCKER := nerdctl
COMPOSE := nerdctl compose
CONTAINER := postgres-15-1

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
	# \l - to show all databases
	# \c <db_name> - switch to another db
	# \dt - list database tables
	# \d <table> - describe a table
	# \d+ <table> - show more info of a table
	# \dn - list all schemas
	# \du - list users and their roles
	# \du <user> - retreive a specific user
	# \df - list all functions
	# \dv - list all views
	# select pg_relation_filepath('<table-name>'); - show paths of physical files
	source .env ; ${DOCKER} run --rm -it --net=local -e PGPASSWORD="$$POSTGRES_PASSWORD" \
	       "$$PULL_THRU_CACHE"library/postgres:15.1-alpine3.17 psql -h ${CONTAINER} -U postgres

.PHONY: check-healthy
check-healthy:
	@source .env ; DOCKER=${DOCKER} CONTAINER=${CONTAINER} CONTAINER_CMD="/healthcheck.sh" ../scripts/healthcheck.sh

.PHONY: wait-healthy
wait-healthy:
	@source .env ; DOCKER=${DOCKER} CONTAINER=${CONTAINER} CONTAINER_CMD="/healthcheck.sh" WAIT=1 ../scripts/healthcheck.sh
