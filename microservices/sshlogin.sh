#!/usr/bin/bash
sshpass -p '2446592ny' ssh -T jianhe@192.168.2.13<< EOF
    IFS=', ' read -r TASKS <<< $1

    for i in "${TASKS[@]}"; do
        echo "$i"
        echo "hello"

        # cd /Users/jianhe/Documents/GitHub/Microservices-Project/microservices/
        # security -v unlock-keychain -p "2446592ny" ~/Library/Keychains/login.keychain-db
        # docker pull jh7939/microservices:"$i"_microservice
        # bash update_containers.sh "$i" 4
    done
EOF