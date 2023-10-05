PULL_THRU_CACHE :=
CONTAINER := grafana-10-1-4

.PHONY: check
check:
	docker ps -a | grep ${CONTAINER}

.PHONY: up
up:
	PULL_THRU_CACHE=${PULL_THRU_CACHE} docker-compose up -d
	cd ../nginx-proxy && make up

.PHONY: down
down:
	docker rm -f ${CONTAINER}

.PHONY: logs
logs:
	docker logs -f ${CONTAINER}

.PHONY: stats
stats:
	docker stats ${CONTAINER}
