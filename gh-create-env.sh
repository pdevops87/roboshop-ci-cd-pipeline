#!/bin/bash
type gh
read -p "Enter organization name:" orgname
read -p "Enter repo name:" reponame
if [ -z "${orgname}" ] ; then
 echo "Please enter organization name"
 exit 1;
fi
if [ -z "${reponame}" ] ; then
 echo "please enter reponame"
 exit 1;
fi
if [ $? -ne 0 ] ; then
 echo "install github cli installation"
 gh extension install katiem0/gh-environments
 echo $?
 exit 1;
fi
gh environments list pdevops87 roboshop-frontend-v1
cat report-environment.csv
gh auth status
if [ $? -ne 0 ] ; then
 echo "login to git cli "
  gh auth login
 exit 1 ;
fi
user_name=$(gh api user --jq '.login')
repoid=$(gh api repos/pdevops87/roboshop-frontend-v1 --jq '.id')
echo $repo_id
echo $user_name
echo RepositoryName,RepositoryID,EnvironmentName,AdminBypass,WaitTimer,Reviewers,PreventSelfReview,BranchPolicyType,Branches >/tmp/github-environment.csv
for i in $(echo $reponame | sed -e  's/,/ /g'); do
for env in dev prod; do
echo "$i,$repoid,$env,TRUE,0,User;${user_name};123148043,FALSE,," >>/tmp/github-environment.csv
done
done
cat /tmp/github-environment.csv
gh environments create pdevops87 --from-file /tmp/github-environment.csv
