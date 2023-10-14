#!/bin/bash

set -e

scriptPath=$(cd $(dirname "$0") && pwd)
projRoot=$scriptPath/../../

cd $projRoot

# TESTS
cd $projRoot/timescaledb-ui && make down up wait-healthy && cd -

# CLEAN UP
cd $projRoot/timescaledb-ui && make down
cd $projRoot/timescaledb-2-9-1 && make down
