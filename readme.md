# Project Title
A simple Serverless application build and deployed using Terraform and tested locally using SAM

## Description

This Project is to build a Serverless application using Terraform, application will be used to generate greeting cards for employees working in a company. This application will be first tested locally using SAM (Serverless Application Model)


## Installation

Follow these steps to install the project:

1. Download the code 
2. Run below command to install the aws plugin for Terraform
    terraform init
3. Validate the terraform structure using 
    terraform validate
4. Run below command to verify the terraform plan
    terraform plan
5. Deploy the resources on AWS run below command
    terraform applu

### Prerequisites

- AWS CLI - installed and configured to work with an AWS Region of your choice
- Terraform CLI
- Text editor or IDE of your choice, such as Visual Studio Code.

### run locally using SAM

To run locally follow below steps

1. sam build --hook-name terraform --beta-features
2. ssam local invoke \
    --hook-name terraform \
    greeting_lambda \
    -e event.json
3. you can also check the api 
    sam local start-api --hook-name terraform

4. curl  -v http://127.0.0.1:3000/greet \
      -H 'Content-Type:application/json' \
      -d '{"employeeId":"amitrai"}'
5. You can test the deployed API using below command
    curl -X POST \
         -H 'Content-Type: application/json' \
         -d '{"employeeId":"johnsmith"}' \
        https://<api-id>.execute-api.<region>.amazonaws.com/prod/greet


