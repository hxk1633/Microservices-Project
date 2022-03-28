#!/usr/bin/bash
IFS=', ' read -a -r TASKS <<< $1

for i in "${TASKS[@]}"; do
    echo "$i"
    echo "hello"
done