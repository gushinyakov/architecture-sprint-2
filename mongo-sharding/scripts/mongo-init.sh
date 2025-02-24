#!/bin/bash

###
# Инициализируем бд
###

bash ./scripts/mongo-init-config.sh &&
    ./scripts/mongo-init-shard1.sh &&
    ./scripts/mongo-init-shard2.sh && 
    ./scripts/mongo-init-router.sh &&
    ./scripts/mongo-add-data.sh &&
    ./scripts/mongo-check-data.sh