#!/bin/bash
log_path=".bug-track.log"
out_path=".out.log"
exec 2>> "$log_path" 1>> "$log_path" #begin tracking
stat_catch=""
dateee
yeeet
stat=$(echo "$?")
if [[ "$stat" -eq 0 ]]
then
	echo "got sum error tho, $stat"
	stat_catch+="$stat "
fi	

for i in `seq 1 10`
do
	echo -n "$i "
done
read -p "insert something : " som
#exec 2<&- #stop tracking
ecco
eded
ls -"let"
echo ""
if [[ "$stat" -ne 0 ]]
then
	echo "got sum error tho, $stat"
	stat_catch+="$stat "	
fi	
#exec 1>> "$out_path"
echo "$stat_catch"

arr=("aku" "kamu" "a" "b")
echo "${#arr[@]}"

exec 2<&- #stop tracking
exec 1<&- #stop tracking
