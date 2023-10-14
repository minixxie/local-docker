#!/bin/bash

set -e

scriptPath=$(cd $(dirname "$0") && pwd)
projRoot=$scriptPath/../../

cd $projRoot

# TESTS
cd $projRoot/zipkin-all-in-one && make down up wait-healthy && cd -

# CLEAN UP
cd $projRoot/zipkin-all-in-one && make down
