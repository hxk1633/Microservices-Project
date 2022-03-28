#!/usr/bin/bash
sshpass -p '2446592ny' ssh -T jianhe@192.168.2.13<< EOF
    cd /Users/jianhe/Documents/GitHub/Microservices-Project/microservices/
    security -v unlock-keychain -p "2446592ny" ~/Library/Keychains/login.keychain-db
    IFS=', '  
    read -A R FOLDERS <<< $1  
    for i in "${FOLDERS[@]}"; do  
        echo "$i"
        echo "hello"
    done
    # git fetch --all
    # git checkout origin/master -- /Users/jianhe/Documents/GitHub/Microservices-Project/microservices/docker-compose.yml
    # docker pull jh7939/microservices:$1_microservice
    # bash add_newservice.sh $1
    # bash update_containers.sh $1 4
    exit
EOF