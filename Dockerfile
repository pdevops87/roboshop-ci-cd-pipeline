FROM                 docker.io/redhat/ubi9
RUN                  mkdir actions-runner
WORKDIR              actions-runner
RUN                  curl -o actions-runner-linux-x64-2.332.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.332.0/actions-runner-linux-x64-2.332.0.tar.gz
ENTRYPOINT ["sleep","3000"]
