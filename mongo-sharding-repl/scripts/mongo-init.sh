#!/bin/bash

###
# Инициализируем бд
###

bash ./scripts/mongo-init-config.sh &&
    ./scripts/mongo-init-shard1.sh &&
    ./scripts/mongo-init-shard2.sh && 
    echo "Routing will be init soon" &&
    sleep 10 &&
    ./scripts/mongo-init-router.sh &&
    ./scripts/mongo-add-data.sh &&
    ./scripts/mongo-check-data.sh