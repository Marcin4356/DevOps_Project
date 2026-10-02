# DevOps Project

A multi-stage DevOps lab combining AWS infrastructure provisioning, Ansible configuration, Jenkins CI, Docker image creation and Kubernetes deployment.

## Architecture

```text
Terraform
   |
   +---- AWS VPC / EC2
   |
   +---- AWS EKS
            |
            v
        Kubernetes
            |
       Application

Ansible
   |
Jenkins controller + build agent
   |
Jenkins pipeline
   |
Maven build / tests / Docker image
```

## Infrastructure

Terraform configurations cover AWS resources including VPC/networking, EC2 instances, security groups and EKS-related IAM and cluster configuration.

The EC2 configuration creates separate hosts for Jenkins controller, Jenkins build agent and Ansible automation.

## Configuration management

Ansible playbooks configure the Jenkins hosts. Separate setup playbooks are provided for the Jenkins controller and build agent.

## CI/CD

The Jenkins pipeline uses a Maven-labeled node and automates application build steps. The repository also contains Sonar configuration for the Java project.

## Containerization

The Dockerfile uses Eclipse Temurin JDK 21 and packages a generated Java JAR into a container image.

## Kubernetes

The Kubernetes manifests define:

- Namespace
- container-registry Secret
- Deployment
- NodePort Service

The deployment script applies the Kubernetes resources with kubectl.

## Technologies

- AWS
- Terraform
- Ansible
- Jenkins
- Java / Maven
- Docker
- Kubernetes
- kubectl
- Sonar configuration
- Linux

This is a personal DevOps lab demonstrating infrastructure provisioning, host configuration, CI/CD, containerization and Kubernetes deployment in one workflow.
