#!/bin/bash

endpoint="http://localhost:8080/messages"

for i in {1..99999}; do
  reading=$(( ( RANDOM % 200 ) ))

  curl -X POST \
    $endpoint \
    -H 'content-type: application/json' \
    -d "{
      \"topic\": \"readings\",
      \"key\": $i,
      \"content\": \"$reading\"
    }"

  echo "key $i / value $reading"
done
