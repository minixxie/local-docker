#!/bin/bash

set -e

scriptPath=$(cd $(dirname "$0") && pwd)
projRoot=$scriptPath/../../

cd $projRoot

# TESTS
cd $projRoot/alertmanager-0-26-0 && make down up wait-healthy && cd -

# CLEAN UP
cd $projRoot/alertmanager-0-26-0 && make down
