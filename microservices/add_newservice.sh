#!/usr/bin/bash
#Get version
VERSION=$(curl --location --user admin:mypassword --request GET 'http://0.0.0.0:5555/v2/services/haproxy/configuration/version') 

#Create new transaction and get the id
TRANSID=$(curl --location --user admin:mypassword --request POST "http://localhost:5555/v2/services/haproxy/transactions?version=${VERSION}" | jq -r '.id')

#Create a new backend
$(curl --location --user admin:mypassword --request POST 'http://localhost:5555/v2/services/haproxy/configuration/backends?transaction_id='$TRANSID'' --header "Content-Type: application/json" --data-raw "{\"name\": \"be_newservice\", \"balance\": {\"algorithm\":\"roundrobin\"}, \"httpchk\": {\"method\": \"HEAD\", \"uri\": \"/\", \"version\": \"HTTP/1.1\"}}")