#!/bin/bash

set -e

scriptPath=$(cd $(dirname "$0") && pwd)
projRoot=$scriptPath/../../

cd $projRoot

# TESTS
cd $projRoot && make down-monitoring up-monitoring && cd -
cd $projRoot/grafana-10-1-4 && make wait-healthy && cd -
cd $projRoot/prometheus-2-47-0 && make wait-healthy && cd -
cd $projRoot/jaeger-all-in-one && make wait-healthy && cd -
cd $projRoot/otel-collector-0-86-0 && make wait-healthy && cd -

# CLEAN UP
cd $projRoot/otel-collector-0-86-0 && make down
cd $projRoot/jaeger-all-in-one && make down
cd $projRoot/prometheus-2-47-0 && make down
cd $projRoot/grafana-10-1-4 && make down
