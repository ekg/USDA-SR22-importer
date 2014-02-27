#!/bin/bash

# creates db for the Nutrition Database for Standard Reference
#  (http://www.ars.usda.gov/Services/docs.htm?docid=18879)
# draws heavily on http://blog.moybella.net/2007/03/10/converting-microsoft-access-mdb-into-csv-or-mysql-in-linux/

VER=22
MYSQLUSER=youruser
MYSQLPASS=yourpass
MYSQLDB=ndb
MYSQLCONN="mysql -u $MYSQLUSER --password=$MYSQLPASS $MYSQLDB"
MDB=data/sr${VER}.mdb # data from the USDA in m$ access format

# Downloading SR database.
if [[ -f data/sr${VER}.mdb ]]
then
	continue
elif [[ -f data/sr${VER}db.zip ]]
then
	unzip data/sr${VER}db.zip sr${VER}.mdb
	mv sr${VER}.mdb data/
else
	wget http://www.ars.usda.gov/SP2UserFiles/Place/12354500/Data/SR${VER}/dnload/sr${VER}db.zip || exit 1
	mv sr${VER}db.zip data/
	unzip data/sr${VER}db.zip sr${VER}.mdb
	mv sr${VER}.mdb data/
fi

# put the schema into the database
echo creating schema in $MYSQLDB

# If custom schema is available, use it. If not, use what is available.
if [[ -f sr${VER}.sql ]]
then
	$MYSQLCONN <sr${VER}.sql
else	
	mdb-schema --drop-table $MDB mysql | $MYSQLCONN
fi

TABLES=`mdb-tables $MDB` # a list of tables in our input
echo adding tables to $MYSQLDB

for table in $TABLES
do
	echo adding $table
	mdb-export -H $MDB $table > $table.sql
	mysqlimport -L -u $MYSQLUSER --password=$MYSQLPASS --fields-terminated-by="," --fields-enclosed-by="\"" $MYSQLDB $table.sql
	rm $table.sql
done

echo done

