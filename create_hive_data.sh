rm -rf ./data.txt  
touch data.txt  
delimiter=','
for((i=0;i<200;i++))  
do  
str1='name';
str2=`openssl rand -base64 8`
num1=`echo $RANDOM`
name=${i}${delimiter}${str1}${i}${delimiter}${str2}${delimiter}${num1}   
echo  $name>> data.txt  
done  

echo "The data has been generated"
hdfs dfs -mkdir -p /tmp/data/test
hdfs dfs -put data.txt /tmp/data/test/