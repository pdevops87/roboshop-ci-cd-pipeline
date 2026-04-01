# roboshop-ci-cd-pipeline


docker run -d -e URL=https://github.com/pdevops87/roboshop-frontend-v1 -e TOKEN=A5LROC4QBNNJ3IN2GWAJ5PTJZLLBK -e NAME=r1  --privileged  -v /var/run/docker.sock:/var/run/docker.sock runner:latest