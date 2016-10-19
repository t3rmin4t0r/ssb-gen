
CREATE EXTERNAL TABLE `customer`(
  `c_custkey` bigint, 
  `c_name` string, 
  `c_address` string, 
  `c_city` string, 
  `c_nation` string, 
  `c_region` string, 
  `c_phone` string, 
  `c_mktsegment` string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE 
LOCATION '${LOCATION}/customer';
  ;
CREATE EXTERNAL TABLE `dates`(
  `d_datekey` bigint, 
  `d_date` string, 
  `d_dayofweek` string, 
  `d_month` string, 
  `d_year` string, 
  `d_yearmonthnum` string, 
  `d_yearmonth` string, 
  `d_daynuminweek` string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE 
LOCATION '${LOCATION}/dates';
  ;
CREATE EXTERNAL TABLE `lineorder`(
  `l_orderkey` bigint, 
  `l_linenumber` int, 
  `l_custkey` bigint, 
  `l_partkey` bigint, 
  `l_suppkey` bigint, 
  `l_orderdate` string, 
  `l_ordpriority` string, 
  `l_shippriority` string, 
  `l_quantity` double, 
  `l_extendedprice` double, 
  `l_ordtotalprice` double, 
  `l_discount` double, 
  `l_revenue` double, 
  `l_supplycost` double, 
  `l_tax` double, 
  `l_commitdate` string, 
  `l_shipmode` string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE 
LOCATION '${LOCATION}/lineorder';
  ;
CREATE EXTERNAL TABLE `part`(
  `p_partkey` bigint, 
  `p_name` string, 
  `p_mfgr` string, 
  `p_category` string, 
  `p_brand1` string, 
  `p_color` string, 
  `p_type` string, 
  `p_size` int, 
  `p_container` string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE 
LOCATION '${LOCATION}/part';
  ;
CREATE EXTERNAL TABLE `supplier`(
  `s_suppkey` bigint, 
  `s_name` string, 
  `s_address` string, 
  `s_city` string, 
  `s_nation` string, 
  `s_region` string, 
  `s_phone` string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE 
LOCATION '${LOCATION}/supplier';
  ;
