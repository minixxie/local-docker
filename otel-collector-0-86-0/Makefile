PULL_THRU_CACHE :=
CONTAINER := otel-collector-0-86-0

.PHONY: check
check:
	docker ps -a | grep ${CONTAINER}

.PHONY: up
up:
	cd ../jaeger-all-in-one && make up
	#cd ../zipkin-all-in-one && make up
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
