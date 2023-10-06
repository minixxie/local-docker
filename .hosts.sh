#!/bin/bash

if [ x"$1" == x ]; then
	echo >&2 "usage: $0 ipAddr"
	exit 0
fi

cat <<EOF
######################################################
# Below are from local-docker, pls copy to /etc/hosts
######################################################
$1  alertmanager.local
$1  gitea.local
$1  grafana.local
$1  graylog-ui.local
$1  kafka.local
$1  kafka-ui.local
$1  prometheus.local
$1  jaeger.local
$1  xxljob.local
$1  zipkin.local
EOF
