provider "aws" {
  region = "us-east-1"
}

data "aws_subnets" "alb" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}

data "aws_security_group" "alb" {
  tags = {
    Name = "demo-alb"
  }
}

resource "aws_instance" "target_instances" {
  for_each               = var.instance_names
  ami                    = var.ami
  key_name               = "demo-ec2-1"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [var.instance_sg_id]
  user_data_base64       = filebase64("${path.module}/scripts/ec2_user_data.sh")

  tags = {
    Name = each.value
  }
}

resource "aws_lb" "tf_alb" {
  name               = "terraforn-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = data.aws_subnets.alb.ids
  security_groups    = [data.aws_security_group.alb.id]

  tags = {
    CreatedVia = "terraform"
  }
}

resource "aws_lb_target_group" "tf_tg" {
  vpc_id   = var.vpc_id
  name     = "tf-alb-tg"
  protocol = "HTTP"
  port     = 80
}


resource "aws_lb_target_group_attachment" "main" {
  for_each         = aws_instance.target_instances
  target_group_arn = aws_lb_target_group.tf_tg.arn
  target_id        = each.value.id
  port             = 80
}

resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.tf_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tf_tg.arn
  }
}

resource "aws_lb_listener_rule" "custom_page" {
  listener_arn = aws_lb_listener.main.arn
  priority     = var.custom_page_rule_priority

  action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      status_code  = 404
      message_body = "4 oh 4"
    }
  }

  condition {
    path_pattern {
      values = ["/error/*"]
    }
  }
}
