#!/bin/bash

# wait for the postgres databases 
echo "Waiting for databases"
until PGPASSWORD="stellar" psql -h "core_database" -U "stellar" -c '\q' "core" 2> /dev/null; do 
  sleep 1
done

until PGPASSWORD="stellar" psql -h "horizon_database" -U "stellar" -c '\q' "horizon" 2> /dev/null; do 
  sleep 1
done
echo "Databases ready"

# load configuration file
rm /etc/default/stellar-horizon
source /etc/horizon/horizon.conf


echo "================ database initialization ================"
stellar-horizon db init

echo "================ genesis state initialization ================"
stellar-horizon ingest init-genesis-state 

echo "================ stellar horizon initialization ================"
stellar-horizon

