#!/bin/bash

pass=hello123
docker run --rm -it --net=local mysql:8.0.31-oracle bash -c \
	"cd /tmp; curl -O https://raw.githubusercontent.com/xuxueli/xxl-job/master/doc/db/tables_xxl_job.sql; mysql -hmysql-8-0-31 -uroot -p$pass < ./tables_xxl_job.sql"
