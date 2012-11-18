#! /bin/bash

abg=`dirname "$0"`
cd $abg

# read config
if [ ! -f config ]; then
	echo "could not read config file."
	cd -
	exit 1
fi
. config

# copy from remote server
if [ $# -ne 1 ]; then
	echo "you have to specify the sheetnumber you want to fetch\nexample: down.sh 02"
	cd -
	exit 1
fi

scp -r $host:abgabe/$1 .


cd -
