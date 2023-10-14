#!/bin/bash

set -e

scriptPath=$(cd $(dirname "$0") && pwd)
projRoot=$scriptPath/../../

cd $projRoot

cd $projRoot/postgres-ui && make down up wait-healthy && cd -
make down-all
