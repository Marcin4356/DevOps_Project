# DevOps Project

A hands-on DevOps infrastructure lab focused on provisioning AWS resources with Terraform, configuring Linux hosts with Ansible, and building a Jenkins-based CI/CD environment.

## Overview

The project provisions multiple EC2 instances in AWS and uses them as separate roles in a DevOps environment:

- Jenkins controller
- Jenkins build agent
- Ansible host

Terraform uses `for_each` to create the required instances from a reusable configuration. Ansible is then used to configure the hosts.

## Architecture

```
AWS
└── VPC
    ├── Jenkins master
    ├── Jenkins build slave
    └── Ansible host
```

The infrastructure is configured for the AWS `eu-north-1` region.

## Technologies

- Terraform
- AWS EC2
- AWS VPC and networking
- Ansible
- Jenkins
- Linux
- Git

## What this project demonstrates

- Infrastructure as Code with Terraform
- Reusable infrastructure using `for_each`
- AWS networking and EC2 provisioning
- Linux host configuration with Ansible
- Separation of CI/CD roles between Jenkins controller and build agent
- Practical DevOps infrastructure automation

## Project structure

```
DevOps_Project/
├── Terraform/
├── Ansible/
└── README.md
```

This is a personal/lab project created to practice infrastructure automation and CI/CD architecture.
