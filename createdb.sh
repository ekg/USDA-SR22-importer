#!/bin/bash

# creates db for the Nutrition Database for Standard Reference
#  (http://www.ars.usda.gov/Services/docs.htm?docid=18879)
# draws heavily on http://blog.moybella.net/2007/03/10/converting-microsoft-access-mdb-into-csv-or-mysql-in-linux/

SR22=data/sr22.mdb # data from the USDA in m$ access format
MYSQLUSER=youruser
MYSQLPASS=yourpass
MYSQLDB=ndb
MYSQLCONN="mysql -u $MYSQLUSER --password=$MYSQLPASS $MYSQLDB"
TABLES=`mdb-tables $SR22` # a list of tables in our input

# create the database if it doesn't exist

echo creating database $MYSQLDB
echo "CREATE DATABASE $MYSQLDB IF NOT EXISTS;" | $MYSQLCONN || exit 1

# put the schema into the database

echo creating schema in $MYSQLDB
#mdb-schema $SR22 | $MYSQLCONN
# The above should work, but the schema requires manual tweaking.
# The schema that mdb-schema produces from the sr22 access database does not
# match mysql's spec.
# Instead we use this hand-edited schema:
$MYSQLCONN <sr22.sql

echo adding tables to $MYSQLDB
for table in $TABLES
do
    echo adding $table
    mdb-export -I $SR22 $table | sed -e 's/)$/)\;/' -e 's/+Zea/_Zea/' | $MYSQLCONN
done

echo done
