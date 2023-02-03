#!/bin/bash

if [ x"$1" == x ]; then
	echo >&2 "usage: $0 ipAddr"
	exit 0
fi

cat <<EOF
$1  gitea.local
EOF
