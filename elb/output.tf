output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value       = aws_lb.tf_alb.dns_name
}

output "alb_arn" {
  description = "The ARN of the Application Load Balancer"
  value       = aws_lb.tf_alb.arn
}

output "alb_listener_arn" {
  description = "The ARN of the ALB listener"
  value       = aws_lb_listener.main.arn
}

output "alb_target_group_arn" {
  description = "The ARN of the ALB target group"
  value       = aws_lb_target_group.tf_tg.arn
}

output "instance_public_ips" {
  description = "Public IPs of the EC2 instances"
  value       = [for i in aws_instance.target_instances : i.public_ip]
}

output "instance_ids" {
  description = "IDs of the EC2 instances"
  value       = [for i in aws_instance.target_instances : i.id]
}
