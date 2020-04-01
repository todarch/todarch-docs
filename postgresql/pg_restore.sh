#!/bin/bash

if [ -z ${TD_POSTGRES_USER+x} ]; then
  echo "[ERROR] 'TD_POSTGRES_USER' is not set"
  exit 1
fi

if [ -z ${TD_POSTGRES_PASSWORD+x} ]; then
  echo "[ERROR] 'TD_POSTGRES_PASSWORD' is not set"
  exit 1
fi

if [[ $# -lt 1 ]] ; then
  echo '[ERROR] You must supply a backup file'
  exit 1
fi

backup_file=$1
export PGPASSWORD="$TD_POSTGRES_USER"
PG_USER="$TD_POSTGRES_USER"
PG_DATABASE="$TD_POSTGRES_USER"

cat "$backup_file" | psql --host=localhost --port=5445 --dbname="$PG_DATABASE" --username="$PG_USER"
