#!/usr/bin/bash
IFS=',' read -ra TASKS <<< $1
echo "${TASKS[@]}"
for i in "${TASKS[@]}"; do
    echo "$i"
    echo "hello"
done