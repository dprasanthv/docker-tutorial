Docker Architecture
===================
Docker daemon which is just an API.
Docker command line which communicates with api

```
docker image ls 

curl --unix-socket /var/run/docker.sock http://unix.sock/images/json | python -m json.tool

docker image rm (multiple names)
```


Build Image Manually
====================

Create Container
---------------
```bash
docker container run -d busybox:1.27.2 sleep 3000

docker container ls
curl --unix-socket /var/run/docker.sock http://unix.sock/containers/json | python -m json.tool

export cid=<container_id>

docker container inspect $cid
docker container stats
```

Build Container
---------------
```bash
docker container exec -ti $cid /bin/sh
echo "Hello World" > helloworld.txt
exit

docker container cp goodbye.txt $cid:/goodbye.txt
docker container exec -ti $cid ls
```

Commit Container to Image
-------------------------
```bash
docker image rm reallybusybox:0.1
docker container commit $cid reallybusybox:0.1
docker image inspect reallybusybox:0.1

#Normally would stop first, but can just halt
docker container rm -f $cid
```

Test Image
----------
Test new container
```bash
docker container run -d --name rbb reallybusybox:0.1 

sleep 3000

docker container exec -ti rbb /bin/sh
ls
```

Dockerfile
==========

```bash
docker image rm reallybusybox:0.1
docker system prune

docker build -t reallybusybox:0.1 .
```

Docker for Desktop
==================

By install .bash_profile, can use docker images as command line tools.

nginx
-----
```bash
cd desktop
nginx

# Can change index.html and will show live
```

If running full command
```bash
docker run -d -p 8080:80 -v $(pwd):/usr/share/nginx/html nginx:1.11.6
```

maven
-----
```bash
mvn version
```


Docker Swarm
============
To simulate edge nodes, using docker-machine.

```bash
docker-machine ls
docker-machine ssh edge0
docker node ls

docker service ls
```

Network
-------
```
docker network create \
  --driver overlay \
  --subnet 172.22.22.0/24 \
  edge

docker network ls
```

Service inside Network
----------------------

```bash
docker service create \
  --name bastion \
  --network edge \
  --detach=false \
  --constraint 'node.hostname == edge0' \
  appropriate/curl sleep 3000

docker service ps bastion

# Demonstrate service configuration bringing back online
docker container rm -f <>

docker exec -ti <container_id> /bin/ash
PS1="bastion:$ "
```


Nginx
-----

##Without publishing port, internal routing only

```bash
docker service create \
  --name web-ui \
  --network edge \
  --detach=false \
  --replicas 3 \
  nginx
```

From bastion
```bash
curl web-ui

nslookup web-ui
nslookup tasks.web-ui
```

##With publishing port using mesh routing.
```bash
docker service create \
  --name web-ui \
  --network edge \
  --detach=false \
  --replicas 1 \
  --publish 8080:80 \
  nginx
```

From edge0
```bash
curl localhost:8080
```

From laptop
```bash
curl 192.168.88.100:8080
curl 192.168.88.101:8080
```

Config and Secret
-----------------

```bash
echo "Alain has 12 toes" | docker secret create my_secret -
docker secret inspect my_secret

echo "{'Alain': {'toes': 12}}" | docker config create my_config -
docker config inspect my_secret

docker service rm bastion

docker service create \
  --name bastion \
  --network edge \
  --detach=false \
  --constraint 'node.hostname == edge0' \
  --secret my_secret \
  --config my_config \
  appropriate/curl sleep 3000

docker exec -ti 61 /bin/ash

cat /run/secrets/my_secret
cat /my_config
```
