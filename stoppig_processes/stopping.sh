#!/bin/bash

clear; ls /usr/sbin/ | while read line; do echo "Stopping ${line}:                        [ OK ]"; sleep 1;done 

exit 0
