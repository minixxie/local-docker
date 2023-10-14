#!/bin/bash

set -e

scriptPath=$(cd $(dirname "$0") && pwd)
projRoot=$scriptPath/../../

cd $projRoot

# TESTS
cd $projRoot/cadvisor-0-47-2 && make down up wait-healthy && cd -

# CLEAN UP
cd $projRoot/cadvisor-0-47-2 && make down
