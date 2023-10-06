#!/bin/bash

scriptPath=$(cd $(dirname "$0") && pwd)

dashboardFolder=/var/lib/grafana/dashboards

dashboardURLs="
https://grafana.com/api/dashboards/12486/revisions/2/download
https://grafana.com/api/dashboards/13946/revisions/5/download
https://grafana.com/api/dashboards/18860/revisions/2/download
"

mkdir -p "$dashboardFolder"
for url in $dashboardURLs; do
	gnetId=$(echo -n "$url" | sed 's/.*dashboards\///' | sed 's/\/.*$//')
	echo "Downloading dashboard $gnetId ..."
	curl "$url" \
		| sed 's/${DS_PROMETHEUS}/Prometheus/g' \
		| sed 's/${DS_PROMETHEUS-FHY}/Prometheus/g' \
		| sed 's/grafanacloud-prom/Prometheus/g' \
		> "$dashboardFolder"/$gnetId.json
done

/run.sh
