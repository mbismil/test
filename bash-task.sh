#!/bin/bash
# Name: bash-task.sh
# Purpose: Check if a file exists or not using custom bash function and return value
# -----------------------------------------------------------------------------------

# set values 
readonly TRUE=0
readonly FALSE=1

# get input from the CLI
file="$1"

# return $TRUE (0) if file found 
# return $FALSE (1) if file not found
is_file_found(){
	[ -f "$1" ] && return $TRUE || return $FALSE
}

# show usage info if $1 not passed to our script
if [ $# -eq 0 ]
then
	echo "Usage: $0 filename"
	exit 1
fi

# let us call our function 
is_file_found "$file"

# take action based upon return value
if [ $? -eq 0 ]
then
	echo "$file added to backup task"
else
	echo "$file not found."
fi
