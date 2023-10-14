#!/bin/bash

set -e

scriptPath=$(cd $(dirname "$0") && pwd)
projRoot=$scriptPath/../../

cd $projRoot

# TESTS
cd $projRoot/mongodb-5-0-21 && make down up wait-healthy && cd -
cd $projRoot/mongodb-3-2-16 && make down up wait-healthy && cd -

# CLEAN UP
cd $projRoot/mongodb-5-0-21 && make down
cd $projRoot/mongodb-3-2-16 && make down
