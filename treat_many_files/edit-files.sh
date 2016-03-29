#!/bin/bash

# editing

PREFIX='file-'
DATE=`date +%Y-%m%d-%H%M-%S`

function create_files() {
        START=$1
	END=$2
	echo "create files"
	for i in `seq ${START} ${END}`; do touch ${PREFIX}${i}; done
}

function move_files() {
	DIR_NAME="coffee-${DATE}"
	echo "create the ${DIR_NAME} directory"
	mkdir ${DIR_NAME}
        START=$1
	END=$2
	MOVE_LIST=`for i in $(seq ${START} ${END}); do echo ${PREFIX}${i}; done`
	echo "move ${MOVE_LIST} to ${DIR_NAME}"
	mv $MOVE_LIST ${DIR_NAME}/
        
}


#create_files 1 10
#move_files 1 10




