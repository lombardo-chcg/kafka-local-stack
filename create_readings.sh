#!/bin/bash

kafkaRestConsumer="http://localhost:8080/messages"

for i in $(seq 99999); do
  count=0
  while read -r; do
    count=$(( $count + 1 ))
    key=$(echo "$i$count")
    lyric="$(echo -e "${REPLY}")"

    # make it pretty
    [[ $((count % 2)) -eq 0 ]] && flair='/////' || flair='\\\\\'
    printf '%*s===>' "$count" | tr ' ' "="
    echo ""

    curl -X POST \
      $kafkaRestConsumer \
      -H 'content-type: application/json' \
      -d "{
        \"topic\": \"readings\",
        \"key\": "$key",
        \"content\": \"$lyric\"
      }"
    echo "$key $flair $lyric"
  done < <(cat data/constant_surprises.txt)
done
