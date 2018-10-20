#!/bin/bash

if [[ $# -lt 1 ]] ; then
	echo '[ERROR] You must supply a backup file'
	exit 1
fi

backup_file=$1
export PGPASSWORD=todarchpass

cat $backup_file | psql --host=localhost --port=5445 --dbname=postgres --username=postgres
