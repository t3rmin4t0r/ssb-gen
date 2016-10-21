create table customer stored as orc as select * from ${SOURCE}.customer sort by c_region;
create table dates stored as orc as select * from ${SOURCE}.dates;
create table part stored as orc as select * from ${SOURCE}.part sort by p_mfgr;
create table supplier stored as orc as select * from ${SOURCE}.supplier sort by s_region;

CREATE TABLE `lineorder`(
  `lo_orderkey` bigint, 
  `lo_linenumber` int, 
  `lo_custkey` bigint, 
  `lo_partkey` bigint, 
  `lo_suppkey` bigint, 
  `lo_ordpriority` string, 
  `lo_shippriority` string, 
  `lo_quantity` DECIMAL(38,18), 
  `lo_extendedprice` DECIMAL(38,18), 
  `lo_ordtotalprice` DECIMAL(38,18), 
  `lo_discount` DECIMAL(38,18), 
  `lo_revenue` DECIMAL(38,18), 
  `lo_supplycost` DECIMAL(38,18), 
  `lo_tax` DECIMAL(38,18), 
  `lo_commitdate` string, 
  `lo_shipmode` string)
partitioned by(lo_orderdate bigint)
stored as orc
;

set hive.exec.dynamic.partition.mode=nonstrict;
set hive.stats.autogather=true;
set hive.optimize.sort.dynamic.partition=true;

insert into lineorder partition(lo_orderdate)
select 
  `lo_orderkey`  ,
  `lo_linenumber` ,
  `lo_custkey`  ,
  `lo_partkey`  ,
  `lo_suppkey`  ,
  `lo_ordpriority`  ,
  `lo_shippriority`  ,
  `lo_quantity`  ,
  `lo_extendedprice`  ,
  `lo_ordtotalprice`  ,
  `lo_discount`  ,
  `lo_revenue`  ,
  `lo_supplycost`  ,
  `lo_tax`  ,
  `lo_commitdate`  ,
  `lo_shipmode`,
   lo_orderdate from
${SOURCE}.lineorder;
