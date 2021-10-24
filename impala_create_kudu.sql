CREATE TABLE testdata.test_kudu
(
id INT, name STRING, password STRING, salary INT,
PRIMARY KEY(id)
)
PARTITION BY HASH PARTITIONS 16
STORED AS KUDU
;
insert into testdata.test_kudu select * from testdata.test;
quit;

