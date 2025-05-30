# Data Sources Example (Terraform)

## Overview

This project demonstrates how to use Terraform data sources to fetch information from external sources dynamically. Data sources allow you to query existing resources or infrastructure details and use them in your Terraform configurations. This project covers fetching AMI IDs, AWS account information, VPC details, availability zones, and creating IAM policy documents.

## Features

- Fetch the latest Ubuntu AMI ID and create an EC2 instance.
- Retrieve AWS account and region information using `aws_caller_identity` and `aws_region` data sources.
- Query existing VPC information using data sources.
- Fetch AWS availability zones to understand the underlying infrastructure.
- Create an IAM policy document dynamically using Terraform data sources.

## Prerequisites

- Terraform installed on your local machine (version 1.0.0 or later).
- AWS CLI configured with appropriate credentials and permissions.
- An AWS account with access to query resources and create infrastructure.

## Steps to Follow

1. **Fetch an AMI ID and Create an EC2 Instance**:
   - Use the `aws_ami` data source to fetch the latest Ubuntu AMI ID.
   - Launch an EC2 instance using the fetched AMI ID.
   - Demonstrate how to fetch AMI data from another AWS region.

2. **Fetch AWS Account and Region Information**:
   - Use the `aws_caller_identity` data source to retrieve AWS account details.
   - Use the `aws_region` data source to fetch the current AWS region.

3. **Fetch VPC Information**:
   - Use the `aws_vpc` data source to query details about an existing VPC.

4. **Fetch AWS Availability Zones**:
   - Use the `aws_availability_zones` data source to list all available zones in the current region.

5. **Create an IAM Policy Document**:
   - Use Terraform's `aws_iam_policy_document` data source to dynamically generate an IAM policy.

## Usage

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/your-username/your-repository.git
   cd 07-data-sources
   ```

2. Initialize Terraform:

    ```bash
    terraform init
    ```

3. Review the execution plan:

    ```bash
    terraform plan
    ```

4. Apply the configuration to create resources:

    ```bash
    terraform apply
    ```

5. Verify the outputs for fetched data and created resources.

6. Destroy the resources to avoid unnecessary costs:

    ```bash
    terraform destroy
    ```

## Project Structure

- main.tf: Contains the Terraform configuration for data sources and resource creation.
- variables.tf: Defines input variables for the project.
- outputs.tf: Specifies the outputs for the fetched data and created resources.

## Notes

- Ensure that the AWS region specified in the data sources matches the region where you want to deploy resources.
- Use proper IAM permissions to allow Terraform to query data sources and create resources.
- Always review the execution plan before applying changes to avoid unintended modifications.

## License

This project is licensed under the MIT License. See the LICENSE file for details.
