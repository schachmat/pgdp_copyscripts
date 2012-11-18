#! /bin/bash

if [ $# -ne 1 ]; then
	echo "you must give the folder with the corrections as commandlineargument\nexample: copy2students.sh 02"
	exit 1
fi

# goto korrektur folder
kor=`dirname "$0"`
cd $kor

# test for valid target
if [ ! -d $kor/$1 ]; then
	echo "$kor/$1 is not a directory"
	cd -
	exit 1
fi

# copy the files to the students folders
for file in $1/*; do
	s=${file##*/}
	if [ -f $file ] && [ ${#s} == 4 ]; then
		g=${s:0:2}
		s=${s:2:2}
		cp -v $file "/home/student${g}${s}/korrektur/${1}"
	else
		echo "ignoring: " $file
	fi
done

cd -
exit 0
