PULL_THRU_CACHE :=
POSTGRES_PASSWORD := hello123

.PHONY: check
check:
	docker ps -a | grep postgis-15-3-3

.PHONY: up
up:
	POSTGRES_PASSWORD=${POSTGRES_PASSWORD} PULL_THRU_CACHE=${PULL_THRU_CACHE} docker-compose up -d

.PHONY: down
down:
	docker rm -f postgis-15-3-3 postgis-ui

.PHONY: logs
logs:
	docker logs -f postgis-15-3-3

.PHONY: stats
stats:
	docker stats postgis-15-3-3

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
	docker run --rm -it --net=local_network -e PGPASSWORD=${POSTGRES_PASSWORD} \
	       ${PULL_THRU_CACHE}postgis/postgis:15-3.3-alpine psql -h postgis-15-3-3 -U postgres
