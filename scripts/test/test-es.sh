#!/bin/bash

set -e

scriptPath=$(cd $(dirname "$0") && pwd)
projRoot=$scriptPath/../../

cd $projRoot

# TESTS
cd $projRoot/elasticsearch-oss-7-10-2 && make down up wait-healthy && cd -

# CLEAN UP
cd $projRoot/elasticsearch-oss-7-10-2 && make down
