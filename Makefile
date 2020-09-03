cnf ?= .env
include $(cnf)
export $(shell sed 's/=.*//' $(cnf))

SERVICE_NAME := $(SERVICE_NAME)
TAG_VERSION := $(TAG_VERSION)
DOCKERFILE := $(DOCKERFILE)
DOCKERHUB_USERNAME := $(DOCKERHUB_USERNAME)

build: ## Build the container
	docker build -f $(DOCKERFILE) -t $(SERVICE_NAME):$(TAG_VERSION) .

build-nc: ## Build the container without caching
	docker build --no-cache -f $(DOCKERFILE) -t $(SERVICE_NAME):$(TAG_VERSION) .

publish:
	@echo 'pushing image tagged $(TAG_VERSION)'
	docker tag $(SERVICE_NAME):$(TAG_VERSION) bensooraj/$(SERVICE_NAME):$(TAG_VERSION)
	docker push $(DOCKERHUB_USERNAME)/$(SERVICE_NAME):$(TAG_VERSION)

clean:
	docker volume prune --force
	docker image prune --force
