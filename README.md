# roboshop-ci-cd-pipeline


docker run -d -e URL=https://github.com/pdevops87/roboshop-frontend-v1 -e TOKEN=A5LROC4QBNNJ3IN2GWAJ5PTJZLLBK -e NAME=r1  --privileged  -v /var/run/docker.sock:/var/run/docker.sock runner:latest



Analogy to remember
Host Docker Engine = the “car that drives containers”
/var/run/docker.sock = the “door to the car”
docker-cli inside container = the “driver inside the container”
Mounting the socket = giving the driver access to the door, so they can control the host engine



Helm → reads kubeconfig → connects to Kubernetes API
kubectl → reads kubeconfig → connects to Kubernetes API


kubeconfig = a config file (like saved login + server address)
Helm = a tool that uses that config
Kubernetes API = the actual system being contacted


kubeconfig = address book + credentials
kubectl = client 1
helm = client 2
Kubernetes API = server


QA deploy control automatically :
=================================
1. Goto environment ---> click on new environments 
2. provide name: dev
3. click on configure environment

go to environment ----> click on new environment
provide name: qa
click on configure environment
click on Required viewers: Add upto 6 more reviewers pdevops87 ---> click on save protection rules button



** create an environment in all the applications 


install github environment:
===========================
gh extension install katiem0/gh-environments
gh environments list -h
gh environments list pdevops87 roboshop-cart-v1
gh environments list pdevops87 roboshop-cart-v1
cat *.csv
gh environment create pdevops87 --from-file *.csv

how do we get user?
gh api user --jq '.id' /user


1. check installation or not if not install
2. list env

first install github-cli
run .sh


*************************************************
dev,QA,UAT,Prod should not do automatically 
someone has to take control and then to run 



✔ Git change = update in repo files
✔ Sync = apply those changes to Kubernetes (create/update/delete)

kubectl → sends YAML → Kubernetes API → EKS creates resources

helm    → generates YAML → Kubernetes API → EKS creates resources


argocd:
=======
1. install argocd
   helm repo add argo https://argoproj.github.io/argo-helm
   helm repo update
2. install chart:

[//]: # (   kubectl create namespace argocd)
   helm install argocd argo/argo-cd 
3. default username is "admin"
4. to know the password: kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
5. helm repo 
6. helm repo list
7. helm  search repo
8. helm repo add (Local Client):
9. helm install (EKS Cluster)
 
kubectl get secrets
kubectl get secrets argocd-initial-admin-secret -o yaml
echo "password" | base64 --decode

through UI:
===========
applicationName: cart
projectName: default
SYNC Policy: manual
repo url: 
path: .
clusterURL:

values.yaml: pass-template-values/cart.yaml

install helm chart through terraform:
======================================