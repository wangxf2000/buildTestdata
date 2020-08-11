kinit -kt /run/cloudera-scm-agent/process/*-hdfs-NAMENODE/hdfs.keytab  hdfs/`hostname`@CLOUDERA.COM   
hdfs dfs -mkdir /user/admin
hdfs dfs -chown admin:admin /user/admin


kinit -kt /run/cloudera-scm-agent/process/*-hive-HIVESERVER2/hive.keytab  hive/`hostname`@CLOUDERA.COM   
sh create_hive_data.sh 
beeline -u "jdbc:hive2://`hostname`:10000/default;principal=hive/_HOST@CLOUDERA.COM;" -f grant.sql
beeline -u "jdbc:hive2://`hostname`:10000/default;principal=hive/_HOST@CLOUDERA.COM;" -f create_hive_test_data.sql
impala-shell -f impala_create_kudu.sql
