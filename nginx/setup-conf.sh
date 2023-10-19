#!/bin/bash

scriptPath=$(cd $(dirname "$0") && pwd)

if [ "$scriptPath" != "" -a -d "$scriptPath"/conf.d ]; then
	rm -f "$scriptPath"/conf.d/*.conf
fi
mkdir -p "$scriptPath"/conf.d

upstreams=$(nerdctl ps -a | sed 1d | awk '{print $NF}' | grep -v nginx)

echo "upstreams: $upstreams ==="

for upstream in $upstreams; do
	if [ -f "$scriptPath"/src/$upstream.conf ]; then
		cp -L -f "$scriptPath"/src/$upstream.conf "$scriptPath"/conf.d/$upstream.conf
	fi
done
cp -f "$scriptPath"/src/_.conf "$scriptPath"/conf.d/_.conf
echo "Prepared sites: "
ls -l "$scriptPath"/conf.d/
