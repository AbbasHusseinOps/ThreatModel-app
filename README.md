# Containerised Threat Modeling Tool App on AWS

<p align="center">
  <img src="media/demo.gif" alt="App demo" width="80%" />
</p>

---

## Tools & Technologies

[![AWS ECS](https://img.shields.io/badge/AWS-ECS-232F3E?logo=amazonaws)](https://aws.amazon.com/ecs/)  
[![Terraform](https://img.shields.io/badge/Terraform-v1.5-623CE4?logo=terraform)](https://www.terraform.io/)  
[![Docker](https://img.shields.io/badge/Docker-blue?logo=docker)](https://www.docker.com/)  
[![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-black?logo=github-actions)](https://github.com/features/actions)  
[![Trivy](https://img.shields.io/badge/Trivy-security-ff69b4?logo=aquasecurity)](https://github.com/aquasecurity/trivy)  
[![Checkov](https://img.shields.io/badge/Checkov-infrastructure-0052cc?logo=bridgecrew)](https://www.checkov.io/)

---

## Project Overview

 This project delivers a fully automated, infrastructure-as-code pipeline for deploying a containerized threat-modeling application to AWS ECS Fargate. 
 
 Infrastructure as Code All AWS resources (ECS cluster, Fargate tasks, networking, IAM roles, etc.) are defined in Terraform, ensuring repeatable, version-controlled provisioning. 
 
 CI/CD Automation GitHub Actions handle the end-to-end workflow: building your Docker image, running tests, applying Terraform changes, and rolling out updates to Fargate—no manual AWS Console steps required.


## Project Structure
```
./
├── app/
├── Dockerfile
├── terraform/
│ ├── main.tf
│ ├── provider.tf
│ ├── variables.tf
│ └── modules/
│      ├── alb/
│      ├── ecs/
│      ├── iam/
│      ├── route53/
│      ├── networking/
│      ├──vpc/
|      |__sgs/
|      |__s3/
|      |__acm
├── .github/
│     └── workflows/
│            ├── build.yml
│            ├── terraformapply.yml
│            ├── terraformdestroy.yml
│            |__ terraformplan.yml
├── media/
│ ├── demo.gif
│ ├── demo.mov
│ └── palette.png
├── .gitignore
├── .terraform.lock.hcl
└── README.md

## Local Setup

### 1. Get the Repository
Clone this project and navigate into its directory:
```bash
git clone https://github.com/AbbasHusseinOps/ThreatModel-app
cd [repo-directory]

yarn install
yarn build
yarn start


GITHUB Action -Build and Push Containerised Image to Amazon ECR

img width="1440" height="900" alt="Image" src="https://github.com/user-attachments/assets/7f84c385-4e90-4547-a344-cad6c0f3ae44" 

GITHUB Actions - Terraform Plan

img width="1440" height="900" alt="Image" src="https://github.com/user-attachments/assets/0d77ce68-2e97-4602-b181-aad18c2f5744" 

GITHUB Actions - Terraform Apply 

img width="1440" height="900" alt="Image" src="https://github.com/user-attachments/assets/bde527ad-18ba-4113-adec-4c7b782eaeb5" 

GITHUB Action - Terraform Destroy 

img width="1440" height="900" alt="Image" src="https://github.com/user-attachments/assets/e3432e1c-d737-43b2-af5e-60b1b29a39e7" 





