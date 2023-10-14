#!/bin/bash

set -e

scriptPath=$(cd $(dirname "$0") && pwd)
projRoot=$scriptPath/../../

cd $projRoot

cd $projRoot/postgis-ui && make down up wait-healthy && cd -
make down-all
