# Managing AWS IAM

This is my second hands-on project with Terraform, and my goal was to get more comfortable with managing AWS IAM resources. I focused on applying some of the best practices I've been learning about.

## What This Configuration Does

This Terraform setup creates a basic set of IAM resources in AWS:

1.  An **IAM Group**.
2.  An **IAM User**.
3.  A custom **IAM Policy** that grants read-only access to S3.
4.  It then **attaches the policy** to the group and **adds the user** to that group.

## Key Things I Learned (Best Practices)

While my VPC project taught me the basics of reusable code, this project was about applying those patterns specifically to AWS IAM. Here's what I focused on:

- **IAM Policy Documents**: I got hands-on experience writing policy documents as JSON within HCL using `jsonencode`. It's a bit tricky, but it's powerful for defining fine-grained permissions.
- **Resource Dependencies in IAM**: I learned how to properly link resources together, like attaching a policy to a group (`aws_iam_group_policy_attachment`) and then adding a user to that group (`aws_iam_group_membership`).
- **Applying the Principle of Least Privilege**: I moved beyond just knowing the theory and actually crafted a policy from scratch that only grants the exact permissions needed.

## How to Use This

1.  **Initialize Terraform**:

    ```sh
    terraform init
    ```

2.  **Plan the changes**:

    ```sh
    terraform plan
    ```

3.  **Apply the configuration**:
    You can use the default variable values or override them.

    ```sh
    # Apply with defaults
    terraform apply

    # Or apply with custom values
    terraform apply -var="user_name=jane" -var="group_name=S3Viewers"
    ```

<!-- ## What's Next?

Now that I have a good handle on basic IAM, I want to tackle more advanced topics:

- **IAM Roles and Instance Profiles**: Figuring out how to let AWS services (like an EC2 instance) assume a role to access other resources securely.
- **Conditional Policies**: Exploring how to create policies that only grant permissions under certain conditions (e.g., based on source IP or if MFA is enabled).
- **Refactoring into a more robust Module**: Turning this into a more advanced module that could, for example, take a list of users and a list of policies to attach. -->
