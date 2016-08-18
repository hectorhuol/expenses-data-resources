#!/bin/bash
set -m

cmd="mongod"
$cmd &
if [ ! -f /data/db/.mongodb_password_set ]; then
    /initial_mongodb_config.sh
fi

fg