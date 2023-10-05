PULL_THRU_CACHE :=
CONTAINER := node-exporter-1-6-1

.PHONY: check
check:
	docker ps -a | grep ${CONTAINER}

.PHONY: up
up:
	PULL_THRU_CACHE=${PULL_THRU_CACHE} docker-compose up -d

.PHONY: down
down:
	docker rm -f ${CONTAINER}

.PHONY: logs
logs:
	docker logs -f ${CONTAINER}

.PHONY: stats
stats:
	docker stats ${CONTAINER}
