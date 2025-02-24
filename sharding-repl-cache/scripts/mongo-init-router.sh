#!/bin/bash

###
# Инициализируем бд
###

docker compose exec -T mongos_router mongosh --port 27021 <<EOF
sh.addShard( "shard1/shard1repl1:27011");
sh.addShard( "shard1/shard1repl2:27012");
sh.addShard( "shard1/shard1repl3:27013");
sh.addShard( "shard2/shard2repl1:27014");
sh.addShard( "shard2/shard2repl2:27015");
sh.addShard( "shard2/shard2repl3:27016");

sh.enableSharding("somedb");
sh.shardCollection("somedb.helloDoc", { "name" : "hashed" } );
EOF
