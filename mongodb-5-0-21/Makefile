PULL_THRU_CACHE :=
CONTAINER := mongodb-5-0-21
MONGODB_ROOT_PASSWORD := hello123

.PHONY: check
check:
	docker ps -a | grep ${CONTAINER}

.PHONY: up
up:
	MONGODB_ROOT_PASSWORD=${MONGODB_ROOT_PASSWORD} PULL_THRU_CACHE=${PULL_THRU_CACHE} docker-compose up -d

.PHONY: down
down:
	docker rm -f ${CONTAINER}

.PHONY: logs
logs:
	docker logs -f ${CONTAINER}

.PHONY: stats
stats:
	docker stats ${CONTAINER}

.PHONY: cli
cli:
	docker run --rm -it --net local_network ${PULL_THRU_CACHE}library/mongo:5.0.21 mongo mongodb://root:${MONGODB_ROOT_PASSWORD}@mongodb-5-0-21:27017/admin
