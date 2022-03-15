#!/usr/bin/bash
sshpass -p '2446592ny' ssh -T jianhe@192.168.2.13 << EOF
	cd /Users/jianhe/Documents/GitHub/Microservices-Project/microservices/services/$1
    bash update_containers.sh $1 4
EOF