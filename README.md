# Student API - GitOps Kubernetes Deployment Platform

A production-ready REST API built using Node.js, Express, and MongoDB with complete DevOps integration using Docker and GitHub Actions.

This project is fully containerized using Docker and follows DevOps best practices with:

- Dockerized deployment
- Automated local setup using Makefile
- CI pipeline using GitHub Actions
- Self-hosted GitHub runner
- Automated testing & linting
- Docker image versioning
- Node.js REST API
- MongoDB
- Kubernetes
- Helm
- Hashicorp Vault
- External Secrets Operator (ESO)
- NGINX Ingress Controller
- ArgoCD GitOps

---

📂 Project Structure

student-api/
|
├──helm/
|    └── student-api/ 
|
├── kubernetes/
|
├── src/
│   ├── controllers/
│   ├── routes/
│   ├── models/
│   ├── middleware/
│   ├── utils/
│   └── app.js
│
├── tests/
├── .github/workflows/
├── Dockerfile
├── docker-compose.yml
├── Makefile
├── package.json
└── README.md


# 🔧 Prerequisites

Make sure the following tools are installed:

- Docker
- Docker Compose
- Make
- Helm
- Homebrew(Mac)

👉 Install Docker Desktop: https://www.docker.com/products/docker-desktop

---

# ⚙️ Features

- ✅ RESTful APIs (CRUD operations)
- ✅ API Versioning (`/api/v1`)
- ✅ Health Check Endpoint (`/health`)
- ✅ Error Logging
- ✅ Dockerized Application
- ✅ Environment-based Configuration
- ✅ MongoDB Integration
- ✅ Automated CI Pipeline
- ✅ Docker Image Versioning
- ✅ Self-hosted GitHub Actions Runner
- ✅ Kubernetes Deployment
- ✅ Helm-Based Release Management
- ✅ Vault-Based Secret Management
- ✅ External Secrets Operator Integration
- ✅ Environment-specific value files
- ✅ Ingress-Based Traffic Routing
- ✅ Production-style Kubernetes Deployment
---

## Architecture

Developer Push
      ↓
GitHub Actions CI
      ↓
Docker Build & Push
      ↓
Update Helm values.yaml
      ↓
Push back to GitHub
      ↓
ArgoCD detects changes
      ↓
Kubernetes deployment sync
      ↓
Application rollout
      ↓
Vault
      ↓
External Secrets Operator
      ↓
Kubernetes Secret
      ↓
Application Environment Variables


# 🚀 Quick Start

## 1. Clone Repository

```bash
git clone https://github.com/BhanuPratapSingh01-dev/student-api.git
cd student-api

2. Create .env File

PORT=8000
NODE_ENV=production
MONGO_URI=mongodb://mongo:27017/my-app-1

▶️ Run Application
make run-api

🔄 Execution Flow
make run-api

The following steps happen automatically:
1.MongoDB container starts
2.Database migrations run
3.API Docker image builds
4.API container starts


🧰 Available Make Commands

make start-db        # Start MongoDB container
make run-migrations  # Run database migrations
make build-api       # Build API Docker image
make run-api         # Run full application (DB + Migration + API)
make down            # Stop all containers
make logs            # View container logs
make test            # Run tests
make lint            # Run ESLint


🐳 Manual Docker Commands 

 Build Docker Image:-
       docker build -t student-api:1.0.0 .

 Run Docker Container:-
       docker run -p 8000:8000 \
       --network my-network \
       --env-file .env \
       student-api:1.0.0


📡API Endpoints

| Method | Endpoint            | Description    |
| ------ | ------------------- | -------------- |
| GET    | `/api/v1/users`     | Get all users  |
| GET    | `/api/v1/users/:id` | Get user by ID |
| POST   | `/api/v1/users`     | Create user    |
| PATCH  | `/api/v1/users/:id` | Update user    |
| DELETE | `/api/v1/users/:id` | Delete user    |


❤️ Health Check

Endpoint
   GET /health

Response

{
  "status": "UP",
  "message": "Server is running"
}



🧪 Testing & Code Quality

Run Tests
   *npm test*

Run ESLint
   *npm run lint*

🚀 CI Pipeline
This project uses GitHub Actions with a self-hosted runner to automate the CI workflow.

✅ CI Pipeline Stages
Install Dependencies
Run Tests
Run ESLint
Docker Login
Build Docker Image
Push Docker Images to Docker Hub

✅ Workflow Features
Self-hosted GitHub Actions Runner
Automated Docker Image Build
Automated Docker Push
Versioned Docker Tags (latest, 1.0.0)
Automated Testing
ESLint Integration

✅ Trigger Conditions
The CI pipeline automatically triggers when changes are made to:

src/**
package.json
package-lock.json
.github/workflows/**

The workflow can also be triggered manually using GitHub Actions.


🐳 Docker Images

Pull Latest Image
     *docker pull bhanurider/student-api:latest*

Pull Versioned Image
     *docker pull bhanurider/student-api:1.0.0*



📦 Docker Hub Repository
https://hub.docker.com/r/bhanurider/student-api



🔄 CI Workflow Architecture
Developer
   ↓
GitHub Repository
   ↓
GitHub Actions
   ↓
Self-hosted Runner
   ↓
Docker Build
   ↓
Docker Hub


🛠 Tech Stack
Node.js
Express.js
MongoDB
Docker
Docker Compose
GitHub Actions
Jest
Supertest
ESLint
Makefile
ArgoCD
Hashicorp Vault
External Secrets Operator
Helm
Minikibe

📌 API Versioning

This project follows Semantic Versioning (SemVer):
1.0.0 → Initial release
1.0.1 → Bug fixes
1.1.0 → New features

## Apple Silicon (M1/M2/M3) Note

This project includes a complete Vagrant-based deployment setup.

However, on Apple Silicon Macs:
- VirtualBox does not support x86 Vagrant boxes properly
- VMware Fusion requires the Vagrant VMware Utility which may fail depending on macOS security restrictions

The deployment architecture, provisioning scripts, Docker Compose setup, Nginx load balancing, and automation are fully implemented and can be verified locally using Docker Compose.

To test locally:

```bash
make up

Application will be available at:

http://localhost:8080



---

# 3. Demonstrate Locally Using Docker Compose

Run:

```bash id="6vqeyu"
make up

-->docker ps
**
Expected:- api1
api2
mongodb
nginx-lb
**
 
# 🌐 Nginx Load Balancer

Nginx is configured as a reverse proxy and load balancer.

Configuration file:
```text
nginx/nginx.conf
```

The API is exposed on:

```text
http://localhost:8080
```


# 📦 Vagrant Provisioning

The project includes:

- Vagrantfile
- Automated provisioning using `scripts/setup.sh`

Provisioning installs:
- Docker
- Docker Compose
- Make

To provision:

```bash
vagrant up
```


# 🏗 Deployment Architecture

The deployment consists of:

- 2 API containers
- 1 MongoDB container
- 1 Nginx load balancer container

Nginx distributes traffic between both API containers using reverse proxy load balancing.

```text
                ┌─────────────┐
                │   Nginx     │
                │ LoadBalancer│
                └──────┬──────┘
                       │
        ┌──────────────┴──────────────┐
        │                             │
 ┌──────▼──────┐               ┌──────▼──────┐
 │ API Node 1  │               │ API Node 2  │
 └─────────────┘               └─────────────┘
                │
                ▼
          ┌──────────┐
          │ MongoDB  │
          └──────────┘
```

Verify API health:

```bash
curl http://localhost:8080/health
```


# ✅ Final Verification

Verify running containers:

```bash
docker compose ps
```

Expected containers:

- api1
- api2
- mongodb
- nginx-lb

## Kubernetes Cluster Setup

- Created a 3-node Minikube cluster
- Added node labels:
  - type=application
  - type=database
  - type=dependent_services
- Verified scheduling using nodeSelector

# Helm-Based Kubernetes Deployment

1.Start Kubernetes Cluster

## Start Minikube

```bash
minikube start --nodes 3 --driver=docker


---

2.Install Helm

```md id="3jwm1m"
## Install Helm

```bash
brew install helm


---

3.Add Helm Repositories

```md id="pjwm4t"
## Add Helm Repositories

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami

helm repo add hashicorp https://helm.releases.hashicorp.com

helm repo add external-secrets https://charts.external-secrets.io

helm repo update



4. Install MongoDB

```md id="8jwm7q"
## Install MongoDB

```bash
helm install mongodb bitnami/mongodb \
  --namespace database \
  --create-namespace \
  --set auth.rootPassword=rootpassword \
  --set auth.username=student \
  --set auth.password=studentpassword \
  --set auth.database=studentdb


---

5. Install Vault

```md id="qjwm2v"
## Install Vault

```bash
helm install vault hashicorp/vault \
  --namespace vault \
  --create-namespace \
  --set "server.dev.enabled=true"



---

6. Install ESO

```md id="hjwm6r"
## Install External Secrets Operator

```bash
helm install external-secrets \
external-secrets/external-secrets \
-n external-secrets \
--create-namespace

---

7.Create Vault Secrets

```md id="0jwm4q"
## Configure Vault Secret

```bash
vault kv put secret/student-api \
username=root \
password=rootpassword \
MONGO_URI="mongodb://root:rootpassword@mongodb.database.svc.cluster.local:27017/studentdb?authSource=admin"

---

8.Deploy Application Using Helm

```md id="vjwm9m"
## Deploy Student API

```bash
helm upgrade --install student-api . \
-f values-dev.yaml \
-n student-api \
--create-namespace

---

9.Verify Deployment

```md id="6jwm1t"
## Verify Deployment

```bash
kubectl get all -n student-api

---

10.Port Forward

```md id="fjwm5x"
## Access Application

```bash
kubectl port-forward svc/student-api 8000:80 -n student-api

---

11.Helm Upgrade

```md id="rjwm8p"
## Upgrade Application

```bash
helm upgrade student-api . \
-f values-dev.yaml \
-n student-api


---

12.Helm Rollback

```md id="8jwm3r"
## Rollback Deployment

```bash
helm rollback student-api 1 -n student-api

---

13.Troubleshooting Section

VERY important.

Example:

```md id="yjwm7n"
## Troubleshooting

### Check Pod Logs

```bash
kubectl logs <pod-name> -n student-api

---

->Check Pod Events
'kubectl describe pod <pod-name> -n student-api'

->Render Helm Templates
'helm template student-api .'

->Validate Helm Chart
'helm lint .'

---

14.Learning Outcomes

This makes your README look strong.

Example:

```md id="hjwm4v"

## Learning Outcomes

- Helm templating
- Kubernetes release management
- Vault secret management
- External Secrets Operator integration
- Kubernetes networking
- Production-style deployment workflows
- Kubernetes troubleshooting


Kubernetes Architecture
## Namespaces

- student-api
- database
- vault
- external-secrets
- argocd

ArgoCD Setup
## ArgoCD GitOps Workflow

ArgoCD continuously watches the GitHub repository and automatically synchronizes Kubernetes resources whenever Helm values or manifests change.

CI/CD Workflow

Code Push
   ↓
GitHub Actions
   ↓
Docker Image Build
   ↓
Push Image
   ↓
Update values-dev.yaml
   ↓
Commit Back To GitHub
   ↓
ArgoCD Detects Change
   ↓
Automatic Kubernetes Deployment


Secret Management Workflow

Vault
   ↓
External Secrets Operator
   ↓
Kubernetes Secret
   ↓
Application Pod

--------------------------------------------------------------------------------

 **Deployment Instructions**

 1.Start Minikube

Bash-> 'minikube start --nodes=3'


 2.Install ArgoCD

Bash-> 'kubectl apply -n argocd -f k8s/argocd/install.yaml'

 3.Deploy Application

Bash-> 'helm upgrade --install student-api ./helm/student-api -n student-api'

 4.Access ArgoCD UI

Bash-> 'kubectl port-forward svc/argocd-server -n argocd 8080:443'

--------------------------------------------------------------------------------

GitOps Validation
->Changing replicaCount in values-dev.yaml automatically triggered Kubernetes rollout through ArgoCD auto-sync.

Troubleshooting Section
## Troubleshooting

- ImagePullBackOff
- CrashLoopBackOff
- Vault sync issues
- MongoDB authentication issues
- Ingress networking issues
- Kubernetes service targetPort mismatch
- ArgoCD CRD installation issues

Learning Outcomes
## Learning Outcomes

- Kubernetes networking
- Helm templating
- GitOps architecture
- CI/CD automation
- Secret management
- Kubernetes reconciliation loops
- ArgoCD auto-sync workflows
- Production-style deployment strategies




👨‍💻 Author
Bhanu Pratap Singh