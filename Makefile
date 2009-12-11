data/sr22db.ZIP:
	cd data/ && wget http://www.ars.usda.gov/SP2UserFiles/Place/12354500/Data/SR22/dnload/sr22db.ZIP

data: data/sr22db.ZIP
	cd data/ && unzip sr22db.ZIP

database: data createdb.sh
	./createdb.sh

sr22: database
	echo creating database!

clean:
	rm data/*
