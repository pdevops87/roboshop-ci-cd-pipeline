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
