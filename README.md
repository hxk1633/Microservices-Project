# Microservices-Project

## Start Microservices
`cd microservices`
`docker-compose up -d`

## Scale Microservices
`docker-compose up -d --scale users=4 threads=4 comments=4 posts=4`

## Stop Microservices
`docker-compose down`