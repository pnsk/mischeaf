#!/bin/bash

# This scripts get the output of `diff` of files underneath DIR_1 and DIR_2.
#

help() {
        echo 'please specify the directories.'
        echo '# ./check_diff.sh DIR_1 DIR_2'
}

if [ -z $1 ] || [ -z $2 ] ;then help; exit ;fi

DIR_1=$1
DIR_2=$2

echo '++++++++++++'
echo "Compare files between ${DIR_1} and ${DIR_2}"
echo '++++++++++++'

echo '------------'
echo "check if files in ${DIR_2} are in ${DIR_1}"
echo '------------'
find ${DIR_2} -type f | cut -d'/' -f2- | while read FILES; do ls ${DIR_1}/${FILES} > /dev/null 2>&1 ;  if [ `echo $?` -ne 0 ]; then echo "${DIR_1}/${FILES} is not found"; fi; done;

echo '------------'
echo "check if files in ${DIR_1} are in ${DIR_2}"
echo '------------'
find ${DIR_1} -type f | cut -d'/' -f2- | while read FILES; do ls ${DIR_2}/${FILES} > /dev/null 2>&1 ;  if [ `echo $?` -ne 0 ]; then echo "${DIR_2}/${FILES} is not found"; fi; done;

echo '++++++++++++'
echo 'completed'
echo '++++++++++++'
exit 0
