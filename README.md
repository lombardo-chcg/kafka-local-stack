# kafka local stack

Sandbox for playing around with Kafka and Confluent tools

### Usage

Open 2 terminal sessions.

Session 1:
```
# start containers
docker-compose up -d

# produce a stream of data (ints) to kafka via a http service
./create_readings.sh
```

Session 2:
```
# watch another service consume stream and produce new output
docker logs -f basic_stream_processor
```
