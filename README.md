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


aws login  credentials:
========================

Access key
Secret access key

AKIAQTJSZBXUPI6MM2UJ

nVqxFAIn2hg2AZPMR0thzcjCfMG/DBvOzcJsP0sI



how to set continuous deployment in separate repos?
go to roboshop-frontend-v1 ---> click on environment ----> add dev,qa,uat,prod,....
like the same way which repos required to add repos

* install gh cli environment:
=============================
* gh extension install katiem0/gh-environments
* gh environments -h
* gh environments list pdevops87 roboshop-frontend-v1
* cat report-env.......
* gh environment create --from-file report-env........csv
* # Get a user's numerical ID
*  gh api user --jq '.id'[The first one fetches your personal profile ID (User ID).]
* The second one fetches that specific project's unique storage ID (Repo ID).[gh api repos/pdevops87/roboshop-frontend-v1 --jq '.id']
* gh api user --jq '.login'
gh api users/username --jq '.login'[username]
gh api users/username --jq '.id'

# Get an organization team's numerical ID
gh api orgs/{org}/teams/{team_slug} --jq '.id'

create      Create environments and metadata.
list        Generate a report of environments and metadata.
secrets     List and Create Environment secrets.
variables   List and Create Environment variables.+

keep in .sh
===========
1. first read a repo
2. if a repo is empty, then should pass a msg as "repo is mandatory"
3. type gh >>&/dev/null [gh is /usr/bin/gh]
4. first check gh installed or not 
5. if not installed , install gh cli env


RepositoryName,RepositoryID,EnvironmentName,AdminBypass,WaitTimer,Reviewers,PreventSelfReview,BranchPolicyType,Branches,CustomDeploymentProtectionPolicy,SecretsTotalCount,VariablesTotalCount
roboshop-frontend-v1,1178995516,dev,true,0,User;PavaniVemasani18;123148043,false,,,,0,0



313  16/05/26 08:29:01 docker exec -it 682f4c94872b /bin/bash
314  16/05/26 15:28:37 gh extension install katiem0/gh-environments
315  16/05/26 15:28:48 gh environments -h
316  16/05/26 15:29:07 gh environment list pdevops87 roboshop-frontend-v1
317  16/05/26 15:30:16 gh environment list
318  16/05/26 15:30:43 gh environment list --help
319  16/05/26 15:31:51 gh environment list -h
320  16/05/26 15:32:01 gh environments list -h
321  16/05/26 15:32:25 gh environments list pdevops87 roboshop-frontend-v1
322  16/05/26 15:33:07 gh environments list pdevops87 roboshop-frontend-v1 -o
323  16/05/26 15:33:24 cat report-environments-20260516153308.csv
324  16/05/26 15:33:55 gh environments list pdevops87 roboshop-frontend-v1 -o report-environment
325  16/05/26 15:34:47 gh auth login
326  16/05/26 15:35:31 gh environments list pdevops87 roboshop-frontend-v1
327  16/05/26 15:36:00 git auth login
328  16/05/26 15:36:08 git auth status
329  16/05/26 15:36:17 gh auth status
330  16/05/26 15:36:24 gh auth login
331  16/05/26 15:42:02 https://github.com/pdevops87
332  16/05/26 15:42:56 gh environments list pdevops87 roboshop-frontend-v1
333  16/05/26 15:43:06 cat  report-environments-20260516154257.csv
334  16/05/26 15:52:15 gh auth status
335  16/05/26 15:52:24 gh auth login
336  16/05/26 15:53:16 gh api users/username --jq
337  16/05/26 15:53:52 gh api users/username --jq '.id'
338  16/05/26 15:54:22 gh api user --jq '.id'
339  16/05/26 15:54:59 gh api user --jq '.login'
340  16/05/26 15:57:10 echo $?



github.com
✓ Logged in to github.com account PavaniVemasani18 (/root/.config/gh/hosts.yml)
- Active account: true
- Git operations protocol: https
- Token: gho_************************************
- Token scopes: 'gist', 'read:org', 'repo', 'workflow'

for i in RepositoryName RepositoryID EnvironmentName AdminBypass WaitTimer Reviewers PreventSelfReview BranchPolicyType Branches CustomDeploymentProtectionPolicy SecretsTotalCount VariablesTotalCount
for env in dev qa prod; do echo "$env" "$i"; done
do
done


for i in "RepositoryName,RepositoryID,EnvironmentName,AdminBypass,WaitTimer,Reviewers,PreventSelfReview,BranchPolicyType,Branches,CustomDeploymentProtectionPolicy,SecretsTotalCount,VariablesTotalCount"; do
for j in "roboshop-frontend-v1,1178995516,dev,true,0,User;PavaniVemasani18;123148043,false,,,,0,0"; do
for env in dev prod; do
echo "$i" "$j" "$env" >>/tmp/github-environment.csv
done
done
done


tool: roboshop-app-repos-env-create
find / -name wsgi


GitHub (Code) ──> CI Pipeline/Docker (Builds Image & Creates Unique ID) ──> AWS ECR (Stores Image)
│
ArgoCD (Fetches Unique ID from ECR) ───────────────────────────────────────────┘
│
▼
EKS Cluster (Runs the Pods)
