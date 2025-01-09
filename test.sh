#!/bin/bash


command=""
ct=0
n=0


read instruction < "$in.txt" 


for word in $instruction; do
	((n++))
done

for word in $instruction; do
	((ct++))

	if [[  "$word" != "BEGIN-REQ"  && "$ct" == 1 ]]; then
 	   echo "sintaxa inceput invalida" > "/tmp/server-replies/$pid"
	   exit 0
	fi

	if [[  "$word" != "END-REQ"  && "$ct" == "$n"  ]]; then
 	   echo "sintaxa final invalida" > "/tmp/server-replies/$pid"
	   exit 0
	fi
#    echo "$ct: $word"
done

ct=0
for word in $instruction; do
	if [[  "$ct" != "$n"  && "$ct" != 1 ]]; then
		man $word 
	fi
done

exit 0
