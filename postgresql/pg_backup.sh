#!/bin/bash

export PGPASSWORD=todarchpass

backup_file=todarch-$(date +%Y%m%d%H%M%S).sql

SCHEMA_LIST="todarch_td, todarch_um"

for SCHEMA in ${SCHEMA_LIST//,/}
do
	pg_dump --host=localhost --port=5445 --user=postgres --schema=$SCHEMA postgres >> $backup_file
	echo "" >> $backup_file
	echo "" >> $backup_file
done

