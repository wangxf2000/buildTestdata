--create table;
CREATE TABLE IF NOT EXISTS test(id INT, name STRING, password STRING, salary INT) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',';
--load data
LOAD DATA INPATH '/tmp/data/test/data.txt' OVERWRITE INTO TABLE test;
--select data;
select * from test;
--create parquet table;
CREATE TABLE IF NOT EXISTS test_parquet(id INT, name STRING, password STRING, salary INT) 
STORED AS PARQUET;
--load test data into parquet table
insert into test_parquet select * from test;

--create ORC table;
CREATE TABLE IF NOT EXISTS test_orc(id INT, name STRING, password STRING, salary INT) 
STORED AS ORC;
--load test data into ORC table
insert into test_orc select * from test;

--create hbase mapping table in hive
CREATE TABLE hive_hbase_table(key int, name String,password String,salary int) 
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES ("hbase.columns.mapping" = ":key,cf1:name,cf1:password,cf1:salary") 
TBLPROPERTIES ("hbase.table.name" = "hbase_table", 
"hbase.mapred.output.outputtable" = "hbase_table");

--load data into hbase table
insert into table hive_hbase_table select * from test;

!q