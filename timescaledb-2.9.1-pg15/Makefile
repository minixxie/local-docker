PULL_THRU_CACHE :=
POSTGRES_PASSWORD := hello123

.PHONY: check
check:
	docker ps -a | grep timescaledb-2-9-1-pg15

.PHONY: up
up:
	POSTGRES_PASSWORD=${POSTGRES_PASSWORD} PULL_THRU_CACHE=${PULL_THRU_CACHE} docker-compose up -d

.PHONY: down
down:
	docker rm -f timescaledb-2-9-1-pg15 timescaledb-ui

.PHONY: logs
logs:
	docker logs -f timescaledb-2-9-1-pg15

.PHONY: stats
stats:
	docker stats timescaledb-2-9-1-pg15

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
	docker run --rm -it --net=local_backend -e PGPASSWORD=${POSTGRES_PASSWORD} \
	       ${PULL_THRU_CACHE}timescale/timescaledb:2.9.1-pg15 psql -h timescaledb-2-9-1-pg15 -U postgres
