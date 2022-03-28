#!/usr/bin/bash
cd /Users/jianhe/Documents/GitHub/Microservices-Project/microservices/
git fetch --all
git checkout origin/master -- /Users/jianhe/Documents/GitHub/Microservices-Project/microservices/docker-compose.yml
IFS=', '  read -ra FOLDERS <<< $1  
for i in "${FOLDERS[@]}"; do
    docker pull jh7939/microservices:${i}_microservice
    bash add_newservice.sh $i
    bash update_containers.sh $i 4
done