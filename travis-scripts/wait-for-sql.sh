#!/bin/sh

RET=1
while [ $RET -ne 0 ]; do
    echo "\n* Waiting for confirmation of MySQL service startup"
    sleep 5
    docker exec -ti prestashop mysql -padmin -h mysql -e "status" > /dev/null 2>&1
    RET=$?
done
