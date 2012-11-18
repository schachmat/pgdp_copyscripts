#! /bin/bash

# usage
if [ $# -ne 1 ]; then
	echo -e "usage: up.sh BLATTNR\nexample: up.sh 02"
	exit
fi

# wechsle ins korrekturverzeichnis
kor=`dirname "$0"`
cd $kor

# read config
if [ ! -f config ]; then
	echo "could not read config file."
	cd -
	exit 1
fi
. config

if [ ! -d $1 ] ; then
	echo "$1 is not a valid directory"
	cd -
	exit 1
fi

scp -r $1 $host:korrektur

cd -
