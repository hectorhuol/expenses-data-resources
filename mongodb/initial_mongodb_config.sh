#!/bin/bash

USER=${MONGODB_USER:-"user"}
DATABASE=${MONGODB_DATABASE:-"expenses"}
PASS=${MONGODB_PASS:-"password"}
_word=$( [ ${MONGODB_PASS} ] && echo "preset" || echo "default" )

RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of MongoDB service startup"
    sleep 5
    mongo --help >/dev/null 2>&1
    RET=$?
done

echo "=> Creating an ${USER} user with a ${_word} password in MongoDB"
mongo << EOF
use $DATABASE
db.test.insert({test:'test'})
db.createUser({user: '$USER', pwd: '$PASS', roles:['readWrite']})
EOF

echo "=> Done!"
touch /data/db/.mongodb_password_set

echo "========================================================================"
echo "You can now connect to this MongoDB server using:"
echo ""
echo "    mongo $DATABASE -u $USER -p $PASS --host <host> --port <port>"
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "========================================================================"