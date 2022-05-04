#!/bin/bash

# wait for the postgres database
echo "Waiting for the database"
until PGPASSWORD="stellar" psql -h "core_database" -U "$POSTGRES_USER" -c '\q' "core" 2> /dev/null; do 
  sleep 1
done

# clean up archive
rm -rf /archive/*

# Initialization
echo "================ database initialization ================"
stellar-core new-db

echo "================ history initialization ================"
stellar-core new-hist local

echo "================ stellar core initialization ================"
stellar-core run