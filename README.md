# DevOps Project

A comprehensive DevOps infrastructure project demonstrating complete CI/CD pipelines, infrastructure automation, and cloud deployment strategies using modern DevOps tools and practices.

## 📋 Description

This project showcases a complete DevOps workflow including infrastructure provisioning with Terraform, configuration management with Ansible, containerization with Docker, orchestration with Kubernetes, and automated CI/CD pipelines with GitHub Actions. It covers development, staging, and production environments.

## 🛠️ Tech Stack

### Infrastructure as Code
- **Terraform** - Infrastructure provisioning (HCL)
- **Ansible** - Configuration management and deployment automation

### Container & Orchestration
- **Docker** - Containerization
- **Docker Compose** - Multi-container orchestration
- **Kubernetes** - Container orchestration at scale
- **Helm** - Kubernetes package management

### CI/CD
- **GitHub Actions** - Automated workflows
- **Jenkins** (optional) - CI/CD pipelines

### Cloud & Networking
- **AWS** - Cloud infrastructure provider
- **AWS ECS** - Container service
- **AWS EKS** - Kubernetes service
- **Load Balancers** - Traffic distribution

### Monitoring & Logging
- **Prometheus** - Metrics collection
- **Grafana** - Metrics visualization
- **ELK Stack** - Centralized logging
- **CloudWatch** - AWS monitoring

## 📋 Prerequisites

Before starting, ensure you have:

- Docker & Docker Compose
- Terraform >= 1.0
- Ansible >= 2.9
- kubectl >= 1.24
- Helm 3+
- AWS CLI configured with credentials
- Git
- AWS Account with appropriate permissions

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/Marcin4356/DevOps_Project.git
cd DevOps_Project
```

### 2. Configure AWS Credentials

```bash
aws configure
# Enter your AWS Access Key ID, Secret Access Key, region, and output format
```

### 3. Initialize Project

```bash
# Set environment variables
export ENVIRONMENT=dev
export AWS_REGION=us-east-1
export PROJECT_NAME=my-devops-project
```

### 4. Deploy Infrastructure with Terraform

```bash
# Navigate to Terraform directory
cd terraform/

# Initialize Terraform
terraform init

# Plan infrastructure
terraform plan -var="environment=$ENVIRONMENT" -out=tfplan

# Apply configuration
terraform apply tfplan

# Save outputs
terraform output -json > ../outputs.json
```

### 5. Configure with Ansible

```bash
# Navigate to Ansible directory
cd ../ansible/

# Update inventory with infrastructure outputs
vim inventory.ini

# Run playbook to configure servers
ansible-playbook -i inventory.ini playbooks/configure-servers.yml

# Deploy application
ansible-playbook -i inventory.ini playbooks/deploy-app.yml
```

### 6. Deploy with Kubernetes/Helm

```bash
# Add Helm repositories
helm repo add myrepo https://charts.example.com/
helm repo update

# Create namespace
kubectl create namespace production

# Deploy application
helm install my-app myrepo/my-app \
  -n production \
  -f kubernetes/values.yaml

# Verify deployment
kubectl get pods -n production
kubectl get svc -n production
```

### 7. Set Up Monitoring

```bash
# Deploy Prometheus and Grafana
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm install prometheus prometheus-community/kube-prometheus-stack \
  -n monitoring \
  --create-namespace

# Access Grafana
kubectl port-forward -n monitoring svc/prometheus-grafana 3000:80
# Visit http://localhost:3000
```

## 📁 Project Structure

```
DevOps_Project/
├── terraform/
│   ├── environments/
│   │   ├── dev/
│   │   │   ├── main.tf
│   │   │   ├── terraform.tfvars
│   │   │   └── outputs.tf
│   │   ├── staging/
│   │   ├── production/
│   │   └── shared/
│   ├── modules/
│   │   ├── vpc/
│   │   ├── eks/
│   │   ├── ecs/
│   │   ├── rds/
│   │   ├── s3/
│   │   ├── security/
│   │   └── monitoring/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── terraform.tfvars.example
├── ansible/
│   ├── playbooks/
│   │   ├── configure-servers.yml
│   │   ├── deploy-app.yml
│   │   ├── setup-monitoring.yml
│   │   ├── backup.yml
│   │   └── security.yml
│   ├── roles/
│   │   ├── common/
│   │   ├── docker/
│   │   ├── monitoring/
│   │   ├── backup/
│   │   └── security/
│   ├── inventory.ini
│   ├── group_vars/
│   │   ├── all.yml
│   │   ├── webservers.yml
│   │   └── databases.yml
│   └── ansible.cfg
├── docker/
│   ├── Dockerfile
│   ├── docker-compose.yml
│   ├── docker-compose.prod.yml
│   └── .dockerignore
├── kubernetes/
│   ├── deployments/
│   │   ├── app-deployment.yaml
│   │   └── worker-deployment.yaml
│   ├── services/
│   │   └── app-service.yaml
│   ├── ingress/
│   │   └── app-ingress.yaml
│   ├── configmaps/
│   ├── secrets/
│   ├── hpa/
│   │   └── app-hpa.yaml
│   └── values.yaml
├── helm/
│   ├── Chart.yaml
│   ├── values.yaml
│   ├── templates/
│   │   ├── deployment.yaml
│   │   ├── service.yaml
│   │   ├── ingress.yaml
│   │   ├── configmap.yaml
│   │   └── hpa.yaml
│   └── values/
│       ├── dev.yaml
│       ├── staging.yaml
│       └── production.yaml
├── scripts/
│   ├── deploy.sh
│   ├── backup.sh
│   ├── restore.sh
│   ├── health-check.sh
│   ├── rollback.sh
│   └── cleanup.sh
├── monitoring/
│   ├── prometheus/
│   │   ├── prometheus.yml
│   │   └── alerts.yml
│   ├── grafana/
│   │   └── dashboards/
│   └── elk/
│       ├── elasticsearch.yml
│       ├── logstash.conf
│       └── kibana.yml
├── .github/
│   └── workflows/
│       ├── build.yml
│       ├── test.yml
│       ├── deploy-dev.yml
│       ├── deploy-staging.yml
│       ├── deploy-production.yml
│       ├── security-scan.yml
│       └── infrastructure-scan.yml
├── .gitignore
├── requirements.txt
├── outputs.json
└── README.md
```

## 🔄 CI/CD Pipeline Workflow

### Automated Workflow Steps

1. **Code Push** → GitHub
2. **Build** → Docker image creation
3. **Test** → Unit and integration tests
4. **Security Scan** → Code and infrastructure scanning
5. **Deploy to Dev** → Automated dev deployment
6. **Manual Approval** → Staging deployment
7. **Deploy to Staging** → Staging environment
8. **Manual Approval** → Production deployment
9. **Deploy to Production** → Production environment

### GitHub Actions Workflows

- **build.yml** - Build Docker images and push to registry
- **test.yml** - Run tests and code quality checks
- **deploy-dev.yml** - Deploy to development environment
- **deploy-staging.yml** - Deploy to staging environment
- **deploy-production.yml** - Deploy to production environment
- **security-scan.yml** - Security vulnerability scanning
- **infrastructure-scan.yml** - Infrastructure security scanning

## 📝 Environment Configuration

### Development Environment

```bash
export ENVIRONMENT=dev
export INSTANCE_TYPE=t3.micro
export MIN_NODES=1
export MAX_NODES=2
```

### Staging Environment

```bash
export ENVIRONMENT=staging
export INSTANCE_TYPE=t3.small
export MIN_NODES=2
export MAX_NODES=5
```

### Production Environment

```bash
export ENVIRONMENT=production
export INSTANCE_TYPE=t3.medium
export MIN_NODES=3
export MAX_NODES=10
```

## 🚀 Deployment Commands

### Deploy to Development

```bash
# Deploy infrastructure
cd terraform/environments/dev
terraform apply

# Configure servers
cd ../../ansible
ansible-playbook -i inventory.ini playbooks/configure-servers.yml -e "env=dev"
```

### Deploy to Staging

```bash
# Use GitHub Actions workflow or
cd terraform/environments/staging
terraform apply
```

### Deploy to Production

```bash
# Use GitHub Actions workflow with manual approval
# Or manually:
cd terraform/environments/production
terraform apply
```

## 🔄 Scaling & Auto-Scaling

### Kubernetes HPA (Horizontal Pod Autoscaler)

```bash
kubectl apply -f kubernetes/hpa/app-hpa.yaml
kubectl get hpa -w
```

### AWS Auto Scaling Groups

Configured in Terraform modules - automatically scales based on:
- CPU utilization
- Memory usage
- Custom metrics

## 💾 Backup & Disaster Recovery

### Automated Backups

```bash
# Run backup script
./scripts/backup.sh --environment production --resource all

# Restore from backup
./scripts/restore.sh --backup-date 2026-04-29 --resource database
```

### RDS Automated Backups

- Retention period: 30 days
- Multi-AZ deployment for production
- Automated snapshots to S3

## 📊 Monitoring & Alerting

### Access Monitoring Dashboards

```bash
# Prometheus
kubectl port-forward -n monitoring svc/prometheus-operated 9090:9090

# Grafana
kubectl port-forward -n monitoring svc/prometheus-grafana 3000:80

# Access logs in ELK Stack
kubectl port-forward -n logging svc/kibana 5601:5601
```

## 🔐 Security Best Practices

- ✅ Infrastructure encryption (EBS, RDS, S3)
- ✅ Network security with VPC and Security Groups
- ✅ RBAC for Kubernetes
- ✅ Secrets management with AWS Secrets Manager
- ✅ SSL/TLS certificates with ACM
- ✅ Regular security audits
- ✅ Container image scanning
- ✅ Infrastructure as Code scanning

## 🧪 Testing

```bash
# Terraform validation
cd terraform
terraform validate
tfsec .

# Ansible syntax check
cd ../ansible
ansible-playbook --syntax-check playbooks/*.yml

# Container security scanning
trivy image my-app:latest

# Infrastructure scanning
cfn-lint templates/
```

## 📚 Resources

- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Ansible Documentation](https://docs.ansible.com/)
- [Kubernetes Documentation](https://kubernetes.io/docs/)
- [Helm Documentation](https://helm.sh/docs/)
- [AWS Documentation](https://docs.aws.amazon.com/)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)

## 📝 License

This project is open source and available under the MIT License.

## 👤 Author

**Marcin4356** - [GitHub Profile](https://github.com/Marcin4356)

---

*Last updated: 2026-04-29*
