#!/bin/bash
#-----------------------------------------------------------------------#
# Name - bckp                                                           #
# Purpose - Backup fuction, From Linux drive to other partition/Windows.# 
# Author - Mohd Haseeb mhaseeb818@gmail.com                             #
# ----------------------------------------------------------------------#
#
#------------Count-----------------#
count()
{
 msg="Syn will start in.."
 clear
 row=0
 col=1
 l=${#msg}
 l=$((l+$col))
 for i in {5..0}
 	do
		tput cup $row $col
		echo -n "$msg""$i"
		sleep 1
		#clear
	done
echo "   Go..";sleep 0.5
}

prog()
{
 local duration=${1}

  already_done() { for ((done=0; done&lt;$elapsed; done++)); do printf ▇; done }
  remaining() { for ((remain=$elapsed; remain&lt;$duration; remain++)); do printf  ; done }
  percentage() { printf | %s%% $(( (($elapsed)*100)/($duration)*100/100 )); }
  clean_line() { printf \r; }

 for (( elapsed=1; elapsed&lt;=$duration; elapsed++ )); do
  already_done; remaining; percentage
  sleep 0.5
  clean_line
  done
 clean_line
}
#-------------------------------main----------------------------#
main()
{
 local dst=/media/mohd/Backup/Ubuntu
 local src=~/Downloads
 local src2=/home/mohd/Desktop
 local dst2=$dst/txt/
 local dst3=$dst/pdf/
 local dst4=$dst/syn/
 local dst5=$dst/dsk/
 local var="$1"
 local opt=-Pav
 #
 # Backup txt files
 [[ $var = "txt" ]] && {
  echo "Copying  "
  prog 10 
  #cp -fv $src2/CMD.txt $dst2
  rsync $opt --ignore-existing $src2/*.txt $dst2
  exit 0;
 }
 # Backup pdf files.
 [[ $var = "pdf" ]] && {
  echo "Copying  "
  #cp -fv $src/1.txt $dst2
  rsync $opt --ignore-existing $src/*.pdf $dst3
  exit 0;
 }
 # Backup of whole ~/Downloads folder ignoring exixting.
 [[ $var = "syn" ]] && {
  count
  rsync $opt --ignore-existing $src/* $dst4
  exit 0;
 }
 # Backup of whole ~/Desktop folder ignoring exixting.
 [[ $var = "dsk" ]] && {
  echo "Sync will start in " 
  rsync $opt --ignore-existing $src2/* $dst5
  exit 0;
 }
}
#--------------------main end--------------------#

#---------------------Usage:----------------------#
 [ $# -eq 0 ] && {
 echo "Usage: $0 attributes
      bckp cmd --> Backup CMD.txt
      bckp pdf --> Backup all PDF files"
      bckp syn --> Backup all files, ignoring existing
      bckp dsk --> Backup all files, ignoring existing

 exit 1;
 }
#-------------------Calling main func------------#
main $1
#--------------------end-------------------------#
