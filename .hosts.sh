#!/bin/bash

if [ x"$1" == x ]; then
	echo >&2 "usage: $0 ipAddr"
	exit 0
fi

cat <<EOF
###########################
# BEGIN: from local-docker
###########################
$1  alertmanager.local
$1  gitea.local
$1  grafana.local
$1  graylog-ui.local
$1  kafka.local
$1  kafka-ui.local
$1  postgis-ui.local
$1  postgres-ui.local
$1  timescaledb-ui.local
$1  prometheus.local
$1  jaeger.local
$1  xxljob.local
$1  zipkin.local
###########################
# END: from local-docker
###########################
EOF
