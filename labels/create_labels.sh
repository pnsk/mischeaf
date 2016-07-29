#!/bin/bash

#----------------------
# PARAMS
#----------------------
PREFIX='labels-'

#----------------------
# GitHub.com PARAMS
#----------------------
DOTCOM_USER=''
DOTCOM_TOKEN='' 
DOTCOM_API='https://api.github.com'
DOTCOM_ORG=''
DOTCOM_REPO=''
DOTCOM_CURL="curl -s -u ${DOTCOM_USER}:${DOTCOM_TOKEN}"

#----------------------
# GHE PARAMS
#----------------------
GHE_USER=''
GHE_TOKEN=''   
GHE_API='https://[hostname]/api/v3'
GHE_ORG=''
GHE_REPO=''
GHE_CURL="curl -k -s -u ${GHE_USER}:${GHE_TOKEN}"

function create_labels_on_com() {
        START=$1
        END=$2
        echo "create files"
        for i in `seq ${START} ${END}` 
        do  
           LABELS_INFO="{\"name\": \"${PREFIX}${i}\",\"color\": \"f29513\"}"
           echo $LABELS_INFO
           ${DOTCOM_CURL} -X POST --data  "${LABELS_INFO}" ${DOTCOM_API}/repos/${DOTCOM_ORG}/${DOTCOM_REPO}/labels
        done
}

function create_labels_on_ghe() {
        START=$1
        END=$2
        echo "create files"
        for i in `seq ${START} ${END}` 
        do  
           LABELS_INFO="{\"name\": \"${PREFIX}${i}\",\"color\": \"f29513\"}"
           echo $LABELS_INFO
           ${GHE_CURL} -X POST --data  "${LABELS_INFO}" ${GHE_API}/repos/${GHE_ORG}/${GHE_REPO}/labels
        done
}



#create_labels_on_com 1 1000
create_labels_on_ghe 1001 5000

