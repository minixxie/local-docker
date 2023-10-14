#!/bin/bash

set -e

scriptPath=$(cd $(dirname "$0") && pwd)
projRoot=$scriptPath/../../

cd $projRoot

# TESTS
cd $projRoot/postgis-ui && make down up wait-healthy && cd -

# CLEAN UP
cd $projRoot/postgis-ui && make down
cd $projRoot/postgis-15-3-3 && make down
