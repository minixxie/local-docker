#!/bin/bash

set -e

scriptPath=$(cd $(dirname "$0") && pwd)
projRoot=$scriptPath/../../

cd $projRoot

# TESTS
cd $projRoot/postgres-ui && make down up wait-healthy && cd -

# CLEAN UP
cd $projRoot/postgres-ui && make down
cd $projRoot/postgres-15-1 && make down
