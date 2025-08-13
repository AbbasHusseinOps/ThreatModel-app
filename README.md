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





