#!/bin/bash

mongo mongodb://root:$MONGO_INITDB_ROOT_PASSWORD@127.0.0.1:27017/admin < /healthcheck.js
