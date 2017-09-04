# kafka local stack

Sandbox for playing around with Kafka and Confluent tools

### Chapter 3: Kafka Connect intro

[Blog post covering this chapter](https://lombardo-chcg.github.io/tools/2017/09/03/kafka-connect-101.html)

### Usage

Open 2 terminal sessions.

Session 1:
```
# start containers
docker-compose up -d

# produce a stream of data (little dragon lyric lines) to kafka via a http service
./create_readings.sh
```

Session 2:
```
# watch kafka connect consume the topic and write to a sink (a local file)
tail -f readings/data.txt
```
