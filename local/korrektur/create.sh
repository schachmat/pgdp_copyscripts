#! /bin/bash

# usage
if [ $# -le 1 ]; then
	echo -e "usage: create.sh BLATTNR [AUFGNR:AUFGPKT]+\nexample: create.sh 02 3:5 4:5"
	exit
fi

# wechsle ins korrekturverzeichnis
kor=`dirname "$0"`
cd $kor

# read config
if [ ! -f students ]; then
	echo "could not read students file."
	cd -
	exit 1
fi

# erstelle basiskorrekturverzeichnis für gewähltes blatt.
blattdir="$1"
mkdir -p "$blattdir"

# erstelle text für korrekturvorlagen.
blattnr="${1##0}"
shift
template=""
for aufg;
do
	aufgnr="${aufg%%:*}"
	aufgpt="${aufg##*:}"
	template="${template}${blattnr}.${aufgnr}\nKeine Abgabe!\npasst\n --> ${aufgpt} / ${aufgpt} Punkte\n\n"
done

# erstelle einzelne korrekturdateien
while IFS= read -r student
do
	echo -e "$template" > "$blattdir/$student"
done < "students"


cd -
