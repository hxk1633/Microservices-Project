#!/usr/bin/bash
sshpass -p '2446592ny' ssh jianhe@192.168.2.13<< EOF
	cd /Users/jianhe/Documents/GitHub/Microservices-Project/microservices/
    docker login
    docker-compose pull
    bash update_containers.sh $1 4
EOF