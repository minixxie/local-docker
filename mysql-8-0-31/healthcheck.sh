#!/bin/bash

mysql -h127.0.0.1 -P3306 -uroot -p${MYSQL_ROOT_PASSWORD} -e'select 1;'
