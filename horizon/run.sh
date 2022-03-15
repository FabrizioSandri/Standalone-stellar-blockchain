#!/bin/bash

# wait for the postgres databases 
while !</dev/tcp/horizon_database/5432; do sleep 1; done; 
while !</dev/tcp/core_database/5432; do sleep 1; done; 

# load configuration file
rm /etc/default/stellar-horizon
source /etc/horizon/horizon.conf


echo "================ database initialization ================"
stellar-horizon db init

echo "================ genesis state initialization ================"
stellar-horizon ingest init-genesis-state 

echo "================ stellar horizon initialization ================"
stellar-horizon

