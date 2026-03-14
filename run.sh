git pull
docker build -t pavanidevops78/kubernetes:runner .
./run.sh
docker run -it -v /var/run/docker.sock:/var/run/docker.sock pavanidevops78/kubernetes:runner
