#!/bin/bash

while IFS=';' read name address time
do
    sed -e "s|<name>|$name|" -e "s|<address>|$address|" -e "s|<time>|$time|" "$1"
    echo "-----"
done < "$2"
