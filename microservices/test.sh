#!/usr/bin/bash
while IFS=';' read -ra ADDR; do
  for i in "${ADDR[@]}"; do
    echo "$i"
  done
done <<< $1