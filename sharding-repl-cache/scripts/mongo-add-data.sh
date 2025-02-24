#!/bin/bash

###
# Добавление данных в бд
###

docker compose exec -T mongos_router mongosh --port 27021 <<EOF
use somedb
for(var i = 0; i < 1000; i++) db.helloDoc.insert({age:i, name:"ly"+i})
db.helloDoc.countDocuments()
EOF
