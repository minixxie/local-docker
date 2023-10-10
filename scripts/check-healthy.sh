#!/bin/bash

# environment variables:
# DOCKER=docker/nerdctl
# CONTAINER=?
# HTTP=http://xxxxxx
# TCP=127.0.0.1:80

checkCmd="/healthcheck -http $HTTP"
if [ "$HTTP" == "" ]; then
	checkCmd="/healthcheck -tcp $TCP"
fi

${DOCKER} exec -it ${CONTAINER} sh -c "$checkCmd > /dev/null 2>&1"
