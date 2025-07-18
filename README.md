# Containerised Threat Modeling Tool App On AWS

<p align="center">
  <img src="media/demo.gif" alt="App demo" width="80%" />
</p>

---

## Tools & Technologies

[![AWS ECS](https://img.shields.io/badge/AWS-ECS-232F3E?logo=amazonaws)](https://aws.amazon.com/ecs/)
…



Project Overview
This repository delivers a fully automated, infrastructure-as-code pipeline for deploying a containerized threat-modeling application to AWS ECS Fargate.

Infrastructure as Code
All AWS resources (ECS cluster, Fargate tasks, networking, IAM roles, etc.) are defined in Terraform, ensuring repeatable, version-controlled provisioning.

CI/CD Automation
GitHub Actions handle the end-to-end workflow: building your Docker image, running tests, applying Terraform changes, and rolling out updates to Fargate—no manual AWS Console steps required.

