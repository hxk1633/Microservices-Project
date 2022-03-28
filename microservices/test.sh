#!/usr/bin/bash
IFS=',' read -a TASKS <<< $1
echo ${#TASKS[@]}
for i in "${TASKS[@]}"; do
    echo "$i"
    echo "hello"
done