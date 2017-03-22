
create table customer stored as orc TBLPROPERTIES("orc.bloom.filter.columns"="*")  as select * from ${SOURCE}.customer cluster by c_custkey ;
create table dates stored as orc TBLPROPERTIES("orc.bloom.filter.columns"="*") as select * from ${SOURCE}.dates cluster by d_datekey;
create table part stored as orc TBLPROPERTIES("orc.bloom.filter.columns"="*") as select * from ${SOURCE}.part cluster by p_partkey;
create table supplier stored as orc TBLPROPERTIES("orc.bloom.filter.columns"="*") as select * from ${SOURCE}.supplier cluster by s_suppkey;
create table lineorder stored as orc TBLPROPERTIES("orc.bloom.filter.columns"="*") as select * from ${SOURCE}.lineorder cluster by lo_orderdate;

