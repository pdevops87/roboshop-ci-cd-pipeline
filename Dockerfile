FROM                 docker.io/redhat/ubi9
RUN dnf -y install curl tar git procps yum-utils \
    && dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo \
    && dnf install -y docker-ce-cli \
    && dnf clean all
RUN                  groupadd  docker
RUN                  useradd -m runner
RUN                  usermod -aG docker runner
RUN                  mkdir actions-runner
USER                 runner
WORKDIR              /home/runner/actions-runner
RUN                  curl -o actions-runner-linux-x64-2.332.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.332.0/actions-runner-linux-x64-2.332.0.tar.gz
RUN                   tar xzf ./actions-runner-linux-x64-2.332.0.tar.gz
RUN                  ./config.sh --unattended --url https://github.com/pdevops87/roboshop-ci-cd-pipeline --token     A5LROCZLHZ4RBNO4PFQ5WRTJWVKEI --name sample --replace
COPY                 run.sh run.sh

ENTRYPOINT           ["bash","run.sh"]




