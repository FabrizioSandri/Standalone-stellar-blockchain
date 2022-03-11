#!/bin/bash

# wait for the postgres database
while !</dev/tcp/core_database/5432; do sleep 1; done; 

# clean up
rm -rf buckets *.log

# Initialization
echo "================ database initialization ================"
stellar-core new-db

echo "================ history initialization ================"
stellar-core new-hist local

echo "================ stellar core initialization ================"
stellar-core run