#!/usr/bin/bash
sshpass -p '2446592ny' ssh jianhe@192.168.2.4 << EOF
	cd /Users/jianhe/Documents/GitHub/Microservices-Project/microservices/
    bash update_containers.sh $1 4
EOF