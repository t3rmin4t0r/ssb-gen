
all: target/lib/dbgen.jar target/ssb-gen-1.0-SNAPSHOT.jar

target/ssb-gen-1.0-SNAPSHOT.jar: $(shell find . -name *.java) 
	mvn package

ssb-dbgen:
	git submodule update

target/tools/: ssb-dbgen
	mkdir -p target/tools/
	cp -avf ssb-dbgen/* target/tools/

target/lib/dbgen.jar: target/tools/dbgen
	cd target/; mkdir -p lib/; jar cvf lib/dbgen.jar tools/

target/tools/dbgen: target/tools
	cd target/tools/; make clean all CC=gcc DATABASE=ORACLE MACHINE=LINUX WORKLOAD=TPCH

clean:
	mvn clean
