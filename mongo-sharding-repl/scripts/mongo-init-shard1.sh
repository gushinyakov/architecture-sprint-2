#!/bin/bash

###
# Инициализируем бд
###


docker compose exec -T shard1repl1 mongosh --port 27011 <<EOF
rs.initiate(
    {
      _id : "shard1",
      members: [
        { _id : 0, host : "shard1repl1:27011" },
        { _id : 1, host : "shard1repl2:27012" },
        { _id : 2, host : "shard1repl3:27013" }
      ]
    }
);
exit();
EOF
