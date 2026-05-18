FROM                 docker.io/redhat/ubi9
RUN                  dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
RUN                  dnf install -y  docker-ce-cli  libicu unzip maven less
# install aws cli
RUN                  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
                     unzip awscliv2.zip && \
                     ./aws/install
#   install helm
RUN                  curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
#                      If any command fails, the script stops immediately (set -eux)
RUN                  set -eux; \
                     curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"; \
                     install -m 0755 kubectl /usr/local/bin/kubectl; \
                     rm kubectl
#  download and install argocd
RUN                  curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
RUN                  chmod +x /usr/local/bin/argocd
RUN                  groupadd  docker || true
RUN                  useradd -m runner
RUN                  usermod -aG docker runner
RUN                  mkdir -p /home/runner/actions-runner
RUN                  curl -o actions-runner-linux-x64-2.332.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.332.0/actions-runner-linux-x64-2.332.0.tar.gz
RUN                  tar xzf ./actions-runner-linux-x64-2.332.0.tar.gz -C /home/runner/actions-runner
RUN                  chown -R runner:runner /home/runner
# copy in runner user so ownership has to be changed
COPY                 --chown=runner:runner run.sh /run.sh
# provide permissions to execute all files in non root user
RUN                  chmod +x /run.sh
USER                 runner
WORKDIR              /home/runner/actions-runner
ENTRYPOINT           ["bash", "/run.sh"]










