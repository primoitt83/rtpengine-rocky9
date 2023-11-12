# rtpengine-rocky9

## How to test

- create a Rocky 9 VM;
- disable ipv6;
- install docker;
- install docker-compose.

Local ip: 192.168.50.42

Create "net" network
````
docker network create --driver=bridge --subnet=172.25.0.0/16 net
````
Run this project:
````
cd /opt
git clone https://github.com/primoitt83/rtpengine-rocky9.git
cd rtpengine-rocky9
docker-compose up -d
````