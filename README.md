# Talent Catalog Monitoring and Evaluation Support

## Overview 

This project contains:
* Superset and Docker configuration for creating a Superset Docker image suitable for uploading
to an Amazon AWS repository.

* Terraform config for deploying docker containers to ECS using Fargate launch type. 
This Terraform part has been forked from https://github.com/bradford-hamilton/terraform-ecs-fargate

## Building and uploading the Superset image to Amazon AWS
        
We refer to the superset image on our staging (test) AWS account, configured for Talent Catalog 
Monitoring & Evaluation purposes as "tc-me-test" (on our production AWS account it is just "tc-me")

Build the Superset image by running the following from the docker directory:
```
docker build -t tc-me-test:latest .
```

Push the image up to an Amazon repository in the Amazon Elastic Container Registry (ECR).
See https://docs.aws.amazon.com/AmazonECR/latest/userguide/docker-push-ecr-image.html

For example (using the Talent Catalog staging (test) AWS account):

Link Docker to AWS (once you have done this, Docker will stay connected to your AWS for 12 hours)
```
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 231168606641.dkr.ecr.us-east-1.amazonaws.com
```

Tag the Docker image we are going to push
```
docker tag tc-me-test:latest 231168606641.dkr.ecr.us-east-1.amazonaws.com/tc-me-test
```

And then push that image
```
docker push 231168606641.dkr.ecr.us-east-1.amazonaws.com/tc-me-test
```
                  
## Building the AWS Infrastructure

TBC

## Documentation
   
* Terraform doc - https://developer.hashicorp.com/terraform/docs 
* Terraform for AWS - https://registry.terraform.io/providers/hashicorp/aws/latest/docs 
