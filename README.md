# Microservices-Project

## Start Microservices
`cd microservices`
`docker-compose up -d`

## Scale Microservices
`docker-compose up -d --scale users=4 --scale threads=4 --scale comments=4 --scale posts=4`

## Stop Microservices
`docker-compose down`
