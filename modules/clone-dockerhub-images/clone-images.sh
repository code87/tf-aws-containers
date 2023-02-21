#!/bin/bash

# Docker must be running locally.
# AWS_ACCOUNT_ID must present in env.
# AWS_REGION must present in env.
# Images list must be passed as space-separated commmand line arguments. Example:
#   ./clone-images.sh ruby:2.7.5-buster postgres:13.8 redis:7.0.5

ECR_ROOT=$AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_ROOT

IMAGES=$@

for IMAGE in ${IMAGES[*]}; do
  echo "Processing $IMAGE..."
  docker pull $IMAGE
  docker tag $IMAGE $ECR_ROOT/$IMAGE
  docker push $ECR_ROOT/$IMAGE
done
