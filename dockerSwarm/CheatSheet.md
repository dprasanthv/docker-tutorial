Docker Commands
===============

```bash
# Halt (no SIGTERM sent) and remove container(s)
docker container rm -f <contatiner_id> <container_id> ..

# Remove image
docker image rm <repository:tag>

# Cleanup
docker system prune

# Inspect how running container was launched
docker container inspect 1d

docker container logs <container_id>

```



New Style
=========
```bash
# Both are equivalent
docker ps
docker container ls

docker images
docker image ls
```
