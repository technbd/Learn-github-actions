DOCKER_REPO = technbd
IMAGE_NAME = nginx
IMAGE_TAG = v1

#BUILD_NUMBER := $(shell date +%Y%m%d%H%M%S)   ### Current timestamp

#DOCKER_USERNAME = your_username
#DOCKER_TOKEN = your_token

docker_login:
	@ echo "Logging in to Docker Hub..."
#	@ docker login -u $$DOCKER_USERNAME -p $$DOCKER_TOKEN
	@ docker login -u $(DOCKER_USERNAME) -p $(DOCKER_TOKEN)


docker_build:
	@ echo "Building Docker image $(DOCKER_REPO)/$(IMAGE_NAME):$(IMAGE_TAG)..."
	@ docker build -t $(DOCKER_REPO)/$(IMAGE_NAME):$(IMAGE_TAG) .


docker_push:
	@ echo "Pushing Docker image $(DOCKER_REPO)/$(IMAGE_NAME):$(IMAGE_TAG)..."
	@ docker push $(DOCKER_REPO)/$(IMAGE_NAME):$(IMAGE_TAG)


all: docker_login docker_build docker_push


