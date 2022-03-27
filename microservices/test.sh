#!/usr/bin/bash
IFS=',' read -ra TASKS <<< $1
for i in "${TASK[@]}"; do
    echo "$i"
    echo "hello"
done