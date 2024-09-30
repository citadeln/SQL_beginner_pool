#!/bin/bash

# sudo -u monroe dropdb pool2
# sudo -u monroe createdb pool
# sudo -u monroe psql -U monroe -d pool < backup.sql

sudo -i -u postgres
psql -U monroe -d pool -h 127.0.0.1 -p 5432
createdb pool;
psql pool < backup.sql;
dropdb pool --force;
