#!/bin/bash

set -e

scriptPath=$(cd $(dirname "$0") && pwd)
projRoot=$scriptPath/../../

cd $projRoot

# TESTS
cd $projRoot/redis-7-0-5 && make down up wait-healthy && cd -

# CLEAN UP
cd $projRoot/redis-7-0-5 && make down
