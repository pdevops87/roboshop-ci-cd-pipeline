# roboshop-ci-cd-pipeline

ci/cd pipeline:
===============
* continuous integration is a software development tool where the the code push into the central repository such as GIT and keep on updating multiple times and push into the GIT repo.
* Each merge triggers an automated "build and test".
Continuous Delivery: The process is automated up until the final release, which requires human approval.
====================
Continuous Deployment: There is no human intervention. If the code passes all tests, it goes straight to the customers
=====================
automatically.

* In our project, developers push code to the GitHub repository. A CI pipeline using GitHub Actions automatically triggers when code is pushed or merged into the main branch. The pipeline builds the application, runs tests, and verifies that the application works correctly.

A workflow is the complete CI/CD process defined in a YAML file, and it contains one or more jobs. Each job contains multiple steps that execute commands.

Workflow = full pipeline

Job = task inside workflow

Step = command inside job


steps to  followed:
===================
1️⃣ Workflow

The whole YAML file is the workflow.

CI Pipeline

This workflow starts when code is pushed to the repository.

2️⃣ Jobs

Inside the workflow we have jobs:

build

test

These are separate tasks.

jobs:
build
test


3️⃣ Steps

Each job contains steps.

Example inside build job:

Checkout code
Install dependencies
Build application

These are commands executed in order.


Simple Flow:
============
Developer pushes code
↓
Workflow triggered
↓
Job 1 → Build application
↓
Job 2 → Run tests
↓
Application ready


to download the code from github repo to linux server /terminal we required github-cli tool
** to create a GitHub repository directly from the terminal, you need GitHub CLI

Git → only works with existing repos  (local)
GitHub CLI (gh) → needed to create/manage repos directly on GitHub from terminal(remote)


*** roboshop-apps-import --- labauto


---------------------------------------------------------------------------------------
history
========
1  13/01/26 18:30:51 sudo dnf update -y
2  13/01/26 18:30:51 sudo dnf update -y
3  13/01/26 18:37:26 sudo init 0
4  14/03/26 08:04:31 sudo su -
5  14/03/26 08:07:41  mkdir actions-runner && cd actions-runner
6  14/03/26 08:07:56  curl -o actions-runner-linux-x64-2.3                                                                                                             32.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.332.0/acti                                                                                                             ons-runner-linux-x64-2.332.0.tar.gz
7  14/03/26 08:08:10 curl -o actions-runner-linux-x64-2.332.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.332.0/actions-runner-linux-x64-2.332.0.tar.gz
8  14/03/26 08:08:18 tar xzf ./actions-runner-linux-x64-2.332.0.tar.gz
9  14/03/26 08:08:29 ls -l
10  14/03/26 08:08:31 ./config.sh --url https://github.com/pdevops87/roboshop-ci-cd-pipeline --token A5LROC7RURLO2UCKKNGRY6DJWT4BS
11  14/03/26 08:09:22 ./config.sh --url https://github.com/pdevops87/roboshop-ci-cd-pipeline --token A5LROC6LCPQKFHG4KGKCWN3JWUS3G
12  14/03/26 08:09:38 ls -l
13  14/03/26 08:09:42 ./config.sh --url https://github.com/pdevops87/roboshop-ci-cd-pipeline --token A5LROC6LCPQKFHG4KGKCWN3JWUS3G
14  14/03/26 08:09:55 ./config.sh --help
15  14/03/26 08:10:40 ./config.sh --unattended --url https://github.com/pdevops87/roboshop-ci-cd-pipeline --token A5LROC6LCPQKFHG4KGKCWN3JWUS3G --replace
16  14/03/26 08:11:08 ls -l
17  14/03/26 08:11:27 ./config.sh remove
18  14/03/26 08:11:57 ./config.sh --unattended --url https://github.com/pdevops87/roboshop-ci-cd-pipeline --token A5LROC6LCPQKFHG4KGKCWN3JWUS3G --replace
19  14/03/26 08:12:13 ls -l
20  14/03/26 08:12:56 ./svc.sh
21  14/03/26 08:13:09 sudo ./svc.sh
22  14/03/26 08:13:15 sudo ./svc.sh install
23  14/03/26 08:13:22 sudo ./svc.sh start
24  14/03/26 08:13:33 ls -l
25  14/03/26 08:15:25 ./run.sh
26  14/03/26 08:15:42 ./svc.sh --help
27  14/03/26 08:15:58 sudo ./svc.sh --help
28  14/03/26 08:16:08 sudo ./svc.sh uninstall
29  14/03/26 08:16:14 ./run.sh
30  14/03/26 08:17:05 ./run.sh --help
31  14/03/26 08:17:43 ./run.sh remove
32  14/03/26 08:18:08 sudo ./svc.sh install
33  14/03/26 08:18:16 sudo ./svc.sh start
34  14/03/26 08:18:21 history



if [ "$1" = "install"  ]; then
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo systemctl enable docker
sudo systemctl start docker
fi

Execute sudo ./bin/installdependencies.sh to install any missing Dotnet Core 6.0 dependencies.


Create the group first (groupadd docker) → ensures the group exists.
Add user to the group (usermod -aG docker runner) → gives the user permissions.
If you skip groupadd:
usermod -aG docker runner
…will fail with:
usermod: group 'docker' does not exist
If the group already exists on the system (common on most Docker-installed hosts), groupadd docker is harmless if you use || true.


sudo useradd -m runner
-m creates a home directory /home/runner.
This user will run commands in the container or system without being root.
