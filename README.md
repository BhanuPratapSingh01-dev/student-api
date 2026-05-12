# 🚀 Student API

A production-ready REST API built using Node.js, Express, and MongoDB with complete DevOps integration using Docker and GitHub Actions.

This project is fully containerized using Docker and follows DevOps best practices with:

- Dockerized deployment
- Automated local setup using Makefile
- CI pipeline using GitHub Actions
- Self-hosted GitHub runner
- Automated testing & linting
- Docker image versioning

---

📂 Project Structure

student-api/
│
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

---

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

👨‍💻 Author
Bhanu Pratap Singh