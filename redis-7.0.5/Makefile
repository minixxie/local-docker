PULL_THRU_CACHE :=

.PHONY: check
check:
	docker ps -a | grep redis-7-0-5

.PHONY: up
up:
	PULL_THRU_CACHE=${PULL_THRU_CACHE} docker-compose up -d

.PHONY: down
down:
	docker rm -f redis-7-0-5

.PHONY: logs
logs:
	docker logs -f redis-7-0-5

.PHONY: stats
stats:
	docker stats redis-7-0-5

.PHONY: cli
cli:
	docker run --rm -it --net=local_backend ${PULL_THRU_CACHE}library/redis:7.0.5-alpine3.16 redis-cli -h redis-7-0-5 -p 6379
