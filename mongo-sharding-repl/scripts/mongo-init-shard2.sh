#!/bin/bash

###
# Инициализируем бд
###

docker compose exec -T shard2repl1 mongosh --port 27014 <<EOF
rs.initiate(
    {
      _id : "shard2",
      members: [
        { _id : 3, host : "shard2repl1:27014" },
        { _id : 4, host : "shard2repl2:27015" },
        { _id : 5, host : "shard2repl3:27016" }
      ]
    }
  );
  exit();
EOF

