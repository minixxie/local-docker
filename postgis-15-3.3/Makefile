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
	docker rm -f postgis-15-3-3

.PHONY: logs
logs:
	docker logs -f postgis-15-3-3

.PHONY: stats
stats:
	docker stats postgis-15-3-3

.PHONY: cli
cli:
	docker run --rm -it --net=local_backend -e PGPASSWORD=${POSTGRES_PASSWORD} \
	       ${PULL_THRU_CACHE}postgis/postgis:15-3.3-alpine psql -h postgis-15-3-3 -U postgres
