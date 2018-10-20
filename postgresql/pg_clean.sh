#!/bin/bash

# drop existing schemas before restoring a backup
# might be useful to wipe out the local/development database
# do not automatically apply to production database

psql --host=localhost --port=5445 --dbname=postgres --username=postgres -f drop-schemas.sql
