#!/bin/bash

###
# Проверка данных в бд
###

docker compose exec -T shard1repl1 mongosh --port 27011 <<EOF
use somedb
db.helloDoc.countDocuments()
EOF

docker compose exec -T shard2repl1 mongosh --port 27014 <<EOF
use somedb
db.helloDoc.countDocuments()
EOF