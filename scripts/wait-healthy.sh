#!/bin/bash

# environment variables:
# DOCKER=docker/nerdctl
# CONTAINER=?
# HTTP=http://xxxxxx
# TCP=127.0.0.1:80

${DOCKER} ps -a | grep ${CONTAINER} > /dev/null
g=$?
s=0
while [ $g -ne 0 ]; do
	printf "\rwaited ${s}s..."
	let "s++"
	sleep 1s
	${DOCKER} ps -a | grep ${CONTAINER} > /dev/null
	g=$?
done

checkCmd="/healthcheck -http $HTTP"
if [ "$HTTP" == "" ]; then
	checkCmd="/healthcheck -tcp $TCP"
fi

${DOCKER} exec -it ${CONTAINER} sh -c \
	"s=$s;"'max=30; c=0; r=1 ; while [ $r -ne 0 ]; do printf "\rwaited ${s}s..."; let "s++"; sleep 1s; '"$checkCmd"' > /dev/null 2>&1; r=$?; let "c++"; if [ $c -ge $max ]; then break; fi; done; if [ $r -eq 0 ]; then printf "\x1B[32m[HEALTHY]\x1B[0m\n"; else printf "\x1B[31m[UNHEALTHY]\x1B[0m\n"; exit 1; fi'
