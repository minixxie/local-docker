#!/bin/bash

set -e

scriptPath=$(cd $(dirname "$0") && pwd)
projRoot=$scriptPath/../../

cd $projRoot

# TESTS
cd $projRoot/xxljob-2-3-1 && make down up wait-healthy && cd -

# CLEAN UP
cd $projRoot/mysql-8-0-31 && make down
cd $projRoot/xxljob-2-3-1 && make down
