DOCKER := nerdctl
COMPOSE := nerdctl compose

.PHONY: check
check:
	${DOCKER} ps -a | grep timescaledb-2-9-1-pg15

.PHONY: up
up:
	${COMPOSE} up -d

.PHONY: down
down:
	${DOCKER} rm -f timescaledb-2-9-1-pg15 timescaledb-ui || true

.PHONY: logs
logs:
	${DOCKER} logs -f timescaledb-2-9-1-pg15

.PHONY: stats
stats:
	${DOCKER} stats timescaledb-2-9-1-pg15

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
	       "$$PULL_THRU_CACHE"timescale/timescaledb:2.9.1-pg15 psql -h timescaledb-2-9-1-pg15 -U postgres
