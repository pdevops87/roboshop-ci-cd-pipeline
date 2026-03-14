git pull
docker build -t pavanidevops78/ci-pipeline .
./run.sh
docker run -it -v /var/run/docker.sock:/var/run/docker.sock pavanidevops78/ci-pipeline
