PULL_THRU_CACHE :=
MONGODB_ROOT_PASSWORD := hello123

.PHONY: check
check:
	docker ps -a | grep mongodb-3-2-16

.PHONY: up
up:
	MONGODB_ROOT_PASSWORD=${MONGODB_ROOT_PASSWORD} PULL_THRU_CACHE=${PULL_THRU_CACHE} docker-compose up -d

.PHONY: down
down:
	docker rm -f mongodb-3-2-16

.PHONY: logs
logs:
	docker logs -f mongodb-3-2-16

.PHONY: stats
stats:
	docker stats mongodb-3-2-16

.PHONY: cli
cli:
	docker run --rm -it --net local_backend ${PULL_THRU_CACHE}library/mongo:3.2.16 mongo mongodb://root:${MONGODB_ROOT_PASSWORD}@mongodb-3-2-16:27017/admin
