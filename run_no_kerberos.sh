export HADOOP_USER_NAME=hdfs
sh create_hive_data.sh 
hdfs dfs -chmod -R 777  /tmp/data/test/
hdfs dfs -chmod 777 /user
beeline -u "jdbc:hive2://`hostname`:10000/default" -f create_hive_test_data.sql
impala-shell -f impala_create_kudu.sql
# add etl_user for BDR
useradd -p `openssl passwd -1 -salt 'cloudera' cloudera` etl_user
hdfs dfs -mkdir /user/etl_user
hdfs dfs -chown etl_user:hadoop /user/etl_user
