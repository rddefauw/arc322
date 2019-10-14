#!/bin/bash
cd ~/environment
java_version=`java -version |& awk -F '"' '/version/ {print $2}'`
if [[ "$java_version" =~ .*1\.8.*  ]]; then
    echo "Java is up to date"
else 
    echo "Updating java to 1.8"
    wget https://d3pxv6yz143wms.cloudfront.net/8.222.10.1/java-1.8.0-amazon-corretto-devel-1.8.0_222.b10-1.x86_64.rpm > /dev/null 2>&1
    sudo yum localinstall -y java-1.8.0-amazon-corretto-devel-1.8.0_222.b10-1.x86_64.rpm > /dev/null 2>&1
fi

echo "export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which javac))))" >> ~/.bashrc
source ~/.bashrc

mvn_version=`mvn -version |& awk '/Apache Maven/ {print $3 }'`
if [[ "$mvn_version" =~ .*3\.6.* ]]; then
    echo "Maven is up to date"
else 
    echo "Updating maven to 3.6"
    wget http://mirror.cc.columbia.edu/pub/software/apache/maven/maven-3/3.6.1/binaries/apache-maven-3.6.1-bin.tar.gz > /dev/null 2>&1
    tar zxvf apache-maven-3.6.1-bin.tar.gz > /dev/null 2>&1
    echo "export PATH=~/environment/apache-maven-3.6.1/bin:$PATH" >> ~/.bashrc
fi