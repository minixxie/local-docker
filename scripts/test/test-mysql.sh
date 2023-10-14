#!/bin/bash

set -e

scriptPath=$(cd $(dirname "$0") && pwd)
projRoot=$scriptPath/../../

cd $projRoot

cd $projRoot/mysql-8-0-31 && make down up wait-healthy && cd -
make down-all
