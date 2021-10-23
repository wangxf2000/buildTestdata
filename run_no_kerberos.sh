export HADOOP_USER_NAME=hdfs
sh create_hive_data.sh 
hdfs dfs -chmod -R 777  /tmp/data/test/
hdfs dfs -chmod 777 /user
beeline -u "jdbc:hive2://`hostname`:10000/default" -f create_hive_test_data.sql
impala-shell -f impala_create_kudu.sql
