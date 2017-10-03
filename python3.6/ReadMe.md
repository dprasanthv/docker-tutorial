## Building a Docker Image from Scratch via DockerFile

* f specifys path of the file

* t for tagging image

* docker build -f DockerFile -t pp:2 .

* docker build -f version-3/DockerFile -t pp:3 .

* docker images -- List of all docker images.

* docker rmi <ImageId> -- Removes docker image. (ImageId can be first 2 characters of ID)


## Running a Docker Container from a Docker Image

* -d flag refers to detached mode of the container. It runs in the background

* --rm refers to remove container when it is done.

* -name names the container.

*  docker run -d -p 8000:8888 --name pp3 pp:3 for running the container in background. (no logs)

* docker run -i -p 8000:8888 --name pp3 pp:3 for running the container in foreground (gives logs).

* docker logs pp3 for logs of the container.

* docker container ps -a  -- gives list of docker container which are running.

* docker start <containerId/ Name>  -- Starts existing container

* docker stop <containerId/ Name> -- Stops running container.

* docker rm <containerId / Name> -- removes the docker container.

# Copy files from/to docker container to/from host machine

* docker cp foo.txt mycontainer:/foo.txt  

* docker cp mycontainer:/foo.txt foo.txt 

# Run Commands in Docker Container without Bash

* -i is interactive terminal.

* -d is background task.

* docker exec -i pp3 git --version

# Run Commands in Docker Container with Bash

* docker exec -it pp3 bash
