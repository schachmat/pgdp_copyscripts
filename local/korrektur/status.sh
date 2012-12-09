#! /bin/bash

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

# get the current sheet
wget -nv -O status.csv "https://docs.google.com/spreadsheet/ccc?key=${csvkey}&output=csv"

# generate status
max_ha_points="0"
while IFS= read -r line
do
	if [ "${line:0:7}" = "student" ]; then
		group=${line:7:2}
		student=${line:9:2}
		ha_points=${line#*,}
		ha_points=${ha_points%%,*}
		ha_perc=${line#*,}
		ha_perc=${ha_perc#*,}
		ha_perc=${ha_perc%%,*}
		pres_points=${line#*,}
		pres_points=${pres_points#*,}
		pres_points=${pres_points#*,}
		pres_points=${pres_points#*,}
		pres_points=${pres_points%%,*}
		echo -e "Hausaufgabenpunkte: $ha_points / $max_ha_points\nProzentsatz der Hausaufgabenpunkte: $ha_perc\nMitarbeitspunkte: $pres_points / 2" > "studstat$group$student"
		echo "studstat$group$student updated"
	elif [ "${line:0:7}" = "Maximal" ]; then
		max_ha_points=${line#*,}
		max_ha_points=${max_ha_points%%,*}
	fi
done < "status.csv"


# upload status to server
scp studstat* $host:korrektur

cd -
