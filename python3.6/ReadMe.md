## Building a Docker Image from Scratch via DockerFile

* f specifys path of the file

* t for tagging image

* docker build -f DockerFile -t pp:2 .

* docker build -f version-3/DockerFile -t pp:3 .

## Running a Docker Container from a Docker Image

* -d flag refers to detached mode of the container. It runs in the background

* --rm refers to remove container when it is done.

* -name names the container.

*  docker run -d -it -p 8000:8888 --name pp3 pp:3 for running the container from the image

* docker logs pp3 for logs of the container
