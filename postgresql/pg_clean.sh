#!/bin/bash

# drop existing schemas before restoring a backup
# might be useful to wipe out the local/development database
# do not automatically apply to production database

psql --host=localhost --port=5445 --dbname=admin --username=admin -f drop-schemas.sql
