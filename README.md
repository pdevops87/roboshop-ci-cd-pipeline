# roboshop-ci-cd-pipeline


docker run -d -e URL=https://github.com/pdevops87/roboshop-frontend-v1 -e TOKEN=A5LROC4QBNNJ3IN2GWAJ5PTJZLLBK -e NAME=r1  --privileged  -v /var/run/docker.sock:/var/run/docker.sock runner:latest



Analogy to remember
Host Docker Engine = the “car that drives containers”
/var/run/docker.sock = the “door to the car”
docker-cli inside container = the “driver inside the container”
Mounting the socket = giving the driver access to the door, so they can control the host engine