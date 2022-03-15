#!/usr/bin/bash
sshpass -p '2446592ny' ssh jianhe@192.168.2.13 << EOF
	ls 
	docker ps
EOF