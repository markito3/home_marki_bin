#!/bin/sh
export JAVA_HOME=/usr/local/java/jdk
export PATH=$JAVA_HOME/bin:$PATH
echo $PATH
rm -r .java
firefox www.vrvs.org
exit
