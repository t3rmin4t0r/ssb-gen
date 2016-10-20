set -e
SCALE=100
make 
hadoop  jar target/ssb-gen-1.0-SNAPSHOT.jar -d /tmp/ssb/${SCALE}/ -s 100
hive -e "create database ssb_${SCALE}_raw; create database ssb_${SCALE}_orc;"

hive --database ssb_${SCALE}_raw -d LOCATION=/tmp/ssb/${SCALE} -f ddl/text.sql
hive --database ssb_${SCALE}_orc -d SOURCE=ssb_${SCALE}_raw -f ddl/orc.sql
