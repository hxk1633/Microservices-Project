#!/usr/bin/bash
IFS=', '  read -ra FOLDERS <<< $1  
for i in "${FOLDERS[@]}"; do  
    echo "$i"
    echo "hello"
done