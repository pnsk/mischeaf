#!/bin/bash

clear; ls /usr/sbin/ | while read line; do printf "Stopping ${line}:\t\t[ \e[32m OK \e[m ]\n"; sleep 1;done

exit 0
