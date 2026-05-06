IMAGE_NAME=student-api
VERSION=1.0.0
DOCKER_USERNAME?=your-docker-username

# -------------------------
# Setup
# -------------------------
setup:
	bash scripts/setup.sh

# -------------------------
# Database
# -------------------------
start-db:
	@if [ -z "$$(docker ps -q -f name=mongo)" ]; then \
		echo "🚀 Starting MongoDB..."; \
		docker-compose up -d mongo; \
	else \
		echo "✅ MongoDB already running"; \
	fi

wait-db:
	@echo "⏳ Waiting for MongoDB to be ready..."
	@sleep 5

run-migrations:
	@echo "📦 Running DB migrations..."
	docker-compose run --rm api node src/config/db.js || echo "⚠️ Migration skipped or already applied"

# -------------------------
# Local Dev
# -------------------------
run-api:
	$(MAKE) start-db
	$(MAKE) wait-db
	$(MAKE) run-migrations
	@echo "🚀 Starting API..."
	docker-compose up --build api

down:
	docker-compose down

logs:
	docker-compose logs -f

# -------------------------
# CI Targets (IMPORTANT)
# -------------------------
ci-build:
	@echo "📦 Installing dependencies..."
	npm install

test:
	@echo "🧪 Running tests..."
	$(MAKE) start-db
	$(MAKE) wait-db
	npm test

lint:
	@echo "🔍 Running lint..."
	npm run lint

# -------------------------
# Docker Build & Push
# -------------------------
build-api:
	@echo "🐳 Building Docker image..."
	docker build -t $(IMAGE_NAME):$(VERSION) .

docker-login:
	@echo "🔐 Logging into Docker..."
	echo $$DOCKER_PASSWORD | docker login -u $$DOCKER_USERNAME --password-stdin

docker-push:
	@echo "🚀 Tagging Docker image..."
	docker tag $(IMAGE_NAME):$(VERSION) $(DOCKER_USERNAME)/$(IMAGE_NAME):latest
	docker tag $(IMAGE_NAME):$(VERSION) $(DOCKER_USERNAME)/$(IMAGE_NAME):$(VERSION)

	@echo "🚀 Pushing Docker images..."
	docker push $(DOCKER_USERNAME)/$(IMAGE_NAME):latest
	docker push $(DOCKER_USERNAME)/$(IMAGE_NAME):$(VERSION)