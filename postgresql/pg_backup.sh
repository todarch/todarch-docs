#!/bin/bash

if [ -z ${TD_POSTGRES_USER+x} ]; then
  echo "[ERROR] 'TD_POSTGRES_USER' is not set"
  exit 1
fi

if [ -z ${TD_POSTGRES_PASSWORD+x} ]; then
  echo "[ERROR] 'TD_POSTGRES_PASSWORD' is not set"
  exit 1
fi

# it is pick up from env by pg_dump, instead of prompting password
export PGPASSWORD="$TD_POSTGRES_PASSWORD"

PG_USER="$TD_POSTGRES_USER"
PG_DATABASE="$TD_POSTGRES_USER"

backup_file=$HOME/back-ups/todarch-backup-$(date +%Y%m%d%H%M%S).sql

SCHEMA_LIST="wisit"

for SCHEMA in ${SCHEMA_LIST//,/}
do
  pg_dump --host=localhost --port=5445 --user=$PG_USER --schema=$SCHEMA $PG_PG_DATABASE >> $backup_file
  echo "" >> $backup_file
  echo "" >> $backup_file
done

