# 🚀 Student API

## 📌 Purpose

A REST API to manage users using **Node.js, Express, and MongoDB**.
This project is fully containerized using Docker and follows DevOps best practices with automated setup using Makefile.

---

## 🔧 Prerequisites

Make sure the following tools are installed:

* Docker
* Docker Compose
* Make

👉 Install Docker Desktop: https://www.docker.com/products/docker-desktop

---

## ⚙️ Features

* ✅ RESTful APIs (CRUD operations)
* ✅ API Versioning (`/api/v1`)
* ✅ Health Check Endpoint (`/health`)
* ✅ Error Logging
* ✅ Dockerized Application
* ✅ Environment-based Configuration
* ✅ MongoDB Integration

---

## 🚀 Quick Start

### 1. Clone Repository

```bash
git clone <repo-url>
cd student-api
```

### 2. Create `.env` File

```env
PORT=8000
NODE_ENV=production
MONGO_URI=mongodb://mongo:27017/my-app-1
```

---

## ▶️ Run Application

```bash
make run-api
```

---

## 🔄 Execution Flow

When you run:

```bash
make run-api
```

The following steps happen automatically:

1. MongoDB container starts (if not already running)
2. Database migrations are executed
3. API container is built and started

---

## 🐳 Available Make Commands

```bash
make start-db        # Start MongoDB container
make run-migrations  # Run database migrations
make build-api       # Build API Docker image
make run-api         # Run full application (DB + Migration + API)
make down            # Stop all containers
make logs            # View container logs
```

---

## 🔧 Manual Docker Commands (Optional)

### Build Image

```bash
docker build -t student-api:1.0.0 .
```

### Run Container

```bash
docker run -p 8000:8000 --network my-network --env-file .env student-api:1.0.0
```

---

## 📡 API Endpoints

### Users

* GET `/api/v1/users` → Get all users
* GET `/api/v1/users/:id` → Get user by ID
* POST `/api/v1/users` → Create user
* PATCH `/api/v1/users/:id` → Update user
* DELETE `/api/v1/users/:id` → Delete user

---

## ❤️ Health Check

```bash
GET /health
```

Response:

```json
{
  "status": "UP",
  "message": "Server is running"
}
```

---

## 🧪 Run Tests

```bash
npm test
```

---

## 🛠 Tech Stack

* Node.js
* Express.js
* MongoDB
* Docker

---

## 📦 Versioning

This project follows **Semantic Versioning (SemVer)**:

* `1.0.0` → Initial release
* `1.0.1` → Bug fixes
* `1.1.0` → New features

---

## 👨‍💻 Author

Bhanu Pratap Singh
