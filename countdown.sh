#!/bin/bash

msg="count..."
clear

#tput cup 1 0
#echo -n "$msg"

l=${#msg}
l=$(( l+1 ))

for i in {30..1}
	do
		tput cup 1 $l
		echo -n "$i"
		sleep 1
		#clear
	done
echo
