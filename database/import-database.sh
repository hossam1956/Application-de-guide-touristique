#!/bin/bash
# Wait until MySQL is ready
echo "Waiting for MySQL to start..."
while ! mysqladmin ping -h"mysql" --silent; do
    sleep 1
done

# Import the database
echo "Importing database..."
mysql -h mysql -u root db_pfa < /docker-entrypoint-initdb.d/db_pfa.sql
echo "Database imported successfully!"