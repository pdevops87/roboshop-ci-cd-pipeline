FROM                 docker.io/redhat/ubi9
RUN                  dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
RUN                  dnf install -y  docker-ce-cli  libicu unzip maven
RUN                  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
                     unzip awscliv2.zip && \
                     ./aws/install
RUN                  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
                     chmod 700 get_helm.sh && \
                     ./get_helm.sh
RUN                  curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
                     chmod +x /usr/local/bin/argocd
RUN                  groupadd  docker || true
RUN                  useradd -m runner
RUN                  usermod -aG docker runner
RUN                  mkdir /home/runner/actions-runner
RUN                  curl -o actions-runner-linux-x64-2.332.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.332.0/actions-runner-linux-x64-2.332.0.tar.gz
RUN                  tar xzf ./actions-runner-linux-x64-2.332.0.tar.gz -C /home/runner/actions-runner
# copy in runner user so ownership has to be changed
COPY                 --chown=runner:runner run.sh /run.sh
# provide permissions to execute all files in non root user
RUN                  chmod +x /run.sh
USER                 runner
WORKDIR              /home/runner/actions-runner
ENTRYPOINT           ["bash", "/run.sh"]










