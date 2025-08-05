# Application Load Balancer (ALB) & EC2

This is my third hands-on project with Terraform, focused on deploying an Application Load Balancer (ALB) and EC2 instances in AWS. The goal is to deepen my understanding of networking and compute resources, and how to connect them using Terraform.

## What This Configuration Does

This Terraform setup provisions the following AWS resources:

- An **Application Load Balancer (ALB)** in a specified VPC.
- **EC2 Instances** (using Amazon Linux 2) that are registered as targets behind the ALB.
- A **Target Group** for the ALB to route traffic to the EC2 instances.
- A **Listener** and a **custom listener rule** for handling HTTP requests, including a fixed 404 response for `/error/*` paths.
- User data to install and start a simple web server on each EC2 instance.

This setup demonstrates how to expose multiple EC2 instances behind a load balancer for high availability and scalability.

## How to Run It

### Prerequisites

1. **Terraform Installed**: [Download link](https://www.terraform.io/downloads.html)
2. **AWS Account**: An active AWS account.
3. **AWS Credentials Configured**: Use the AWS CLI (`aws configure`) to set this up.
4. **VPC and Security Group**: You need an existing VPC and security group for the ALB and EC2 instances. You can use the outputs from the VPC project.

### Commands

1. **Initialize**:

   ```sh
   terraform init
   ```

   This downloads the AWS provider plugin.

2. **Plan**:

   ```sh
   terraform plan
   ```

   This shows what will be created and helps verify your configuration.

3. **Apply**:

   ```sh
   terraform apply
   ```

   This provisions the resources in AWS.

   > **Tip:** You can override variables (like VPC ID or security group) using `-var` flags if needed.

## Key Learnings & Notes

Here are some important concepts I practiced in this project:

- **Connecting Resources Across Projects**: The ALB and EC2 instances are deployed into an existing VPC and security group, showing how to reuse outputs from other Terraform projects.
- **User Data for EC2**: Used a shell script to bootstrap each EC2 instance with a web server, demonstrating how to automate instance configuration. Learned to use Terraform’s `filebase64` function to read and encode files for use as user data, enabling scripts to be passed directly to EC2 instances during provisioning.
- **ALB Listener Rules**: Added a custom listener rule to return a fixed 404 response for specific paths, showing how to handle advanced routing scenarios.
- **Outputs**: Defined outputs for key resources (ALB DNS, instance IPs, etc.) to make it easy to find and use them after deployment.
- **Separation of Concerns**: Continued the practice of splitting configuration into logical files ([main.tf](http://_vscodecontentref_/0), [variables.tf](http://_vscodecontentref_/1), [output.tf](http://_vscodecontentref_/2), [terraform.tf](http://_vscodecontentref_/3)) for clarity and maintainability.

## Cleaning Up

To avoid AWS charges, destroy all resources created by this project with:

```sh
  terraform destory
```
