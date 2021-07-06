#!/bin/bash
set -e
apt-get update
apt-get install -y postgresql
pg_ctlcluster 11 main start
sleep 5
DB_NAME=postgres
DB_USER=postgres
DB_USER_PASS=deploy
su postgres <<EOF
createdb  $DB_NAME;
psql -c "CREATE USER $DB_USER WITH PASSWORD '$DB_USER_PASS';"
psql -c "grant all privileges on database $DB_NAME to $DB_USER;"
echo "Postgres User '$DB_USER' and database '$DB_NAME' created."
EOF
./bin/catalina.sh run
