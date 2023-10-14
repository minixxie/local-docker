#!/bin/bash

set -e

scriptPath=$(cd $(dirname "$0") && pwd)
projRoot=$scriptPath/../../

cd $projRoot

# TESTS
cd $projRoot/clickhouse-server-23-9-1 && make down up wait-healthy && cd -

# CLEAN UP
cd $projRoot/clickhouse-server-23-9-1 && make down
