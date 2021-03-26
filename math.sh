#!/bin/bash
#!/bin/bash
# Name - math.sh
# Purpose - Demo return value 
# ------------------------------------

## user define function
math(){
	local a=$1
	local b=$2
	local sum=$(( a + b))
	return $sum
}

## call the math function with 5 and 10 as  arguments 
#math 5 10

## display back result (returned value) using $?

math $1 $2
echo "$?"
