#!/bin/bash

# environment variables:
# DOCKER=docker/nerdctl
# CONTAINER=?
# HTTP=http://xxxxxx
# TCP=127.0.0.1:80
# CONTAINER_CMD="xxx"
# WAIT=1

c=0
max=300  # 5 mins

${DOCKER} ps -a | grep ${CONTAINER} > /dev/null
r=$?
s=0
while [ $r -ne 0 ]; do
	let "s++"
	sleep 1
	printf "\rwaited ${s}s..."
	${DOCKER} ps -a | grep ${CONTAINER} > /dev/null
	r=$?
	let "c++"
	if [ $c -ge $max ]; then
		break;
	fi
done
if [ $r -ne 0 ]; then
	printf "\x1B[31m[UNHEALTHY]\x1B[0m\n"
	exit 1
fi

checkCmd="/healthcheck -http $HTTP"
if [ "$HTTP" == "" ]; then
	checkCmd="/healthcheck -tcp $TCP"
fi
if [ "$CONTAINER_CMD" != "" ]; then
	if [ "$HTTP" != "" ]; then
		CONTAINER_CMD="/healthcheck -http $HTTP"
	else
		CONTAINER_CMD="/healthcheck -tcp $TCP"
	fi
fi


${DOCKER} exec ${CONTAINER} $CONTAINER_CMD > /dev/null 2>&1
r=$?
if [ "$WAIT" == 1 ]; then
	let "c++"
	while [ $r -ne 0 ]; do
		let "s++"
		sleep 1
		printf "\rwaited ${s}s..."
		${DOCKER} exec ${CONTAINER} $CONTAINER_CMD > /dev/null 2>&1
		r=$?
		let "c++"
		if [ $c -ge $max ]; then
			break;
		fi
	done
fi
if [ $r -ne 0 ]; then
	printf "\x1B[31m[UNHEALTHY]\x1B[0m\n"
	exit 1
fi
printf "\x1B[32m[HEALTHY]\x1B[0m\n"
