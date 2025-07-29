# AWS VPC

This is my first hands-on project for learning Terraform. The goal is to create a basic Virtual Private Cloud (VPC) in AWS.

## What This Configuration Does

This Terraform setup provisions a standard AWS VPC with essential components:

- A **VPC** with a `10.0.0.0/16` CIDR block.
- **Public and private subnets** in different Availability Zones for High Availability (HA).
- An **Internet Gateway** for internet access to the public subnets.
- A **Route Table** to direct traffic from the public subnets to the internet.
- A **Network ACL (NACL)** and a **Security Group** with basic rules for HTTP, HTTPS, and SSH.

This represents a foundational setup for deploying applications on AWS.

## How to Run It

Here are the steps to get this running.

### Prerequisites

1.  **Terraform Installed**: [Download link](https://www.terraform.io/downloads.html).
2.  **AWS Account**: An active AWS account.
3.  **AWS Credentials Configured**: Use the AWS CLI (`aws configure`) to set this up.

### Commands

1.  **Initialize**:

    ```bash
    terraform init
    ```

    This downloads the AWS provider plugin.

2.  **Plan**:

    ```bash
    terraform plan
    ```

    This shows what will be created. Good for a final check.

3.  **Apply**:
    ```bash
    terraform apply
    ```
    This builds the resources in AWS.

## Key Learnings & Notes

These are some important concepts I've picked up from this project:

- **File Structure**: It's good practice to split the configuration into multiple files:

  - `main.tf`: For the main resources.
  - `variables.tf`: For defining input variables. This makes the configuration reusable.
  - `outputs.tf`: To declare output values, making them easy to query after deployment.
  - `terraform.tf`: To lock provider and Terraform versions.

- **Dynamic and Reusable Code**:

  - **Variables**: Using a `variables.tf` file lets me easily change things like CIDR blocks or subnets without editing the main logic. It makes the code much more flexible.
  - **Outputs**: The `outputs.tf` file is great for showing important resource IDs after `terraform apply` runs. I can get this info anytime with the `terraform output` command.
  - **`for_each` Meta-Argument**: I used this to create the public and private subnets. It loops over the maps I defined in `variables.tf`, which means I don't have to write a separate resource block for every single subnet. This is a powerful way to write cleaner, more scalable code.

- **Security Rules**: The security group rules here are open to all IPs (`0.0.0.0/0`). For a real project, I need to lock this down to specific IPs.

- **Idempotency**: A key Terraform feature. Running `terraform apply` multiple times won't create duplicate resources; it only makes changes to match the configuration.

- **State File (`terraform.tfstate`)**: This file tracks the resources Terraform manages. I should not edit it manually. For team projects, this would be stored remotely (like in an S3 bucket).

- **Cleaning Up**: To delete all the resources created by this project and avoid AWS charges, I can run:
  ```bash
  terraform destroy
  ```
