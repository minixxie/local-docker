#!/bin/bash

# environment variables:
# DOCKER=docker/nerdctl
# CONTAINER=?
# HTTP=http://xxxxxx
# TCP=127.0.0.1:80
# CONTAINER_CMD="xxx"

checkCmd="/healthcheck -http $HTTP"
if [ "$HTTP" == "" ]; then
	checkCmd="/healthcheck -tcp $TCP"
fi

if [ "$CONTAINER_CMD" != "" ]; then
	${DOCKER} exec -it ${CONTAINER} $CONTAINER_CMD
else
	${DOCKER} exec -it ${CONTAINER} sh -c "$checkCmd > /dev/null 2>&1"
fi
