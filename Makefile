# Makefile for BayRate
#
# Program requires the following libraries:
#   - MySql development libraries
#   - MySql++ library
#   - GNU Scientific Library
#   - Boost Library

LIBS=-lm -lgsl -lgslcblas -lmysqlpp -lboost_date_time
INC=-I/usr/include/mysql
FLAGS=-g -Wall

all: bayrate check #basicrate copyMembership syncDBs
	#executables removed 4/2021 Github Issue #9. Legacy applications.

bayrate: bayrate.cpp db.o collection.o game.o player.o
	g++ $(FLAGS) db.o collection.o game.o bayrate.cpp player.o $(INC) $(LIBS) -o bayrate

check: check.cpp db.o collection.o game.o player.o
	g++ $(FLAGS) db.o collection.o game.o check.cpp player.o $(INC) $(LIBS) -o check

db.o: db.cpp tdListEntry.h
	g++ $(FLAGS) -c db.cpp -o db.o $(INC) $(LIBS)

game.o: game.cpp
	g++ $(FLAGS) -c game.cpp -o game.o $(INC) $(LIBS)

test-game.o: test-game.cpp
	g++ $(FLAGS) -c test-game.cpp -o test-game.o $(INC) $(LIBS)

player.o: player.cpp
	g++ $(FLAGS) -c player.cpp -o player.o $(INC) $(LIBS)

collection.o: collection.cpp tdListEntry.h
	g++ $(FLAGS) -c collection.cpp -o collection.o $(INC) $(LIBS)

clean:
	rm *.o
	rm bayrate
	rm check

archive:
	tar zcvf BayRate.tgz *.cpp *.h makefile COPYING RankChanges.pl
