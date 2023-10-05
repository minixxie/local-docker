PULL_THRU_CACHE :=
CONTAINER := graylog-5-1-5
MONGODB_ROOT_PASSWORD := hello123

.PHONY: check
check:
	docker ps -a | grep ${CONTAINER}

.PHONY: up
up:
	cd ../mongodb-5-0-21 && make up
	cd ../elasticsearch-oss-7-10-2 && make up
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

# Preparation: https://go2docs.graylog.org/5-0/downloading_and_installing_graylog/docker_installation.htm
# follow "How to Get in Log Data" to add input source first
writelog:
	docker run --rm -it --net=local_network ubuntu bash -c "apt-get update && apt-get -q -y install netcat; echo 'Log message' | netcat graylog-5-1-5 5555"
