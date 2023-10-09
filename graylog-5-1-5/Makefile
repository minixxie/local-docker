DOCKER := nerdctl
COMPOSE := nerdctl compose
CONTAINER := graylog-5-1-5

.PHONY: check
check:
	${DOCKER} ps -a | grep ${CONTAINER}

.PHONY: up
up:
	cd ../mongodb-5-0-21 && make up
	cd ../elasticsearch-oss-7-10-2 && make up
	${COMPOSE} up -d

.PHONY: down
down:
	${DOCKER} rm -f ${CONTAINER} || true

.PHONY: logs
logs:
	${DOCKER} logs -f ${CONTAINER}

.PHONY: stats
stats:
	${DOCKER} stats ${CONTAINER}

# Preparation: https://go2docs.graylog.org/5-0/downloading_and_installing_graylog/${DOCKER}_installation.htm
# follow "How to Get in Log Data" to add input source first
writelog:
	${DOCKER} run --rm -it --net=local ubuntu bash -c "apt-get update && apt-get -q -y install netcat; echo 'Log message' | netcat graylog-5-1-5 5555"
