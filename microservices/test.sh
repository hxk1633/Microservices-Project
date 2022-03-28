#!/usr/bin/bash
cd /Users/jianhe/Documents/GitHub/Microservices-Project/microservices/
git fetch --all
git checkout origin/master -- /Users/jianhe/Documents/GitHub/Microservices-Project/microservices/docker-compose.yml
IFS=', '  read -ra FOLDERS <<< $1  
for i in "${FOLDERS[@]}"; do  
    docker pull jh7939/microservices:$1_microservice
    bash add_newservice.sh $1
    bash update_containers.sh $1 4
done