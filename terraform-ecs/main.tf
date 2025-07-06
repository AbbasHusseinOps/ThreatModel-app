provider "aws" {
  region = "eu-west-2"
}

resource "aws_vpc" "abbas_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "abbas_public_1" {
  vpc_id                  = aws_vpc.abbas_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "abbas_public_2" {
  vpc_id                  = aws_vpc.abbas_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "eu-west-2b"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "abbas_igw" {
  vpc_id = aws_vpc.abbas_vpc.id
}

resource "aws_route_table" "abbas_public_rt" {
  vpc_id = aws_vpc.abbas_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.abbas_igw.id
  }
}

resource "aws_route_table_association" "abbas_rta_1" {
  subnet_id      = aws_subnet.abbas_public_1.id
  route_table_id = aws_route_table.abbas_public_rt.id
}

resource "aws_route_table_association" "abbas_rta_2" {
  subnet_id      = aws_subnet.abbas_public_2.id
  route_table_id = aws_route_table.abbas_public_rt.id
}

resource "aws_security_group" "abbas_sg" {
  name        = "abbas_sg"
  description = "Allow HTTP(80), HTTPS(443) and app(3000)"
  vpc_id      = aws_vpc.abbas_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_acm_certificate" "abbas_cert" {
  domain      = "*.abbashussein.com"
  statuses    = ["ISSUED"]
  most_recent = true
}

resource "aws_lb" "abbas_alb" {
  name               = "abbas-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.abbas_public_1.id, aws_subnet.abbas_public_2.id]
  security_groups    = [aws_security_group.abbas_sg.id]
}

resource "aws_lb_target_group" "abbas_tg" {
  name        = "abbas-tg"
  port        = 3000
  protocol    = "HTTP"
  vpc_id      = aws_vpc.abbas_vpc.id
  target_type = "ip"

  health_check {
    path                = "/"
    port                = "traffic-port"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.abbas_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "https_listener" {
  load_balancer_arn = aws_lb.abbas_alb.arn
  port              = 443
  protocol          = "HTTPS"
  certificate_arn   = data.aws_acm_certificate.abbas_cert.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.abbas_tg.arn
  }
}

resource "aws_iam_role" "ecs_execution_role" {
  name = "ecsTaskExecutionRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = { Service = "ecs-tasks.amazonaws.com" }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_execution_attach" {
  role       = aws_iam_role.ecs_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_ecs_cluster" "abbas_cluster" {
  name = "abbas_cluster"
}

resource "aws_ecs_task_definition" "abbas_task" {
  family                   = "abbas-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_execution_role.arn

  container_definitions = jsonencode([
    {
      name         = "my-app"
      image        = "885073318616.dkr.ecr.eu-west-2.amazonaws.com/abbas-app-repo:latest"
      portMappings = [{
        containerPort = 3000
        hostPort      = 3000
        protocol      = "tcp"
      }]
    }
  ])
}

resource "aws_ecs_service" "abbas_service" {
  name            = "abbas_service"
  cluster         = aws_ecs_cluster.abbas_cluster.id
  task_definition = aws_ecs_task_definition.abbas_task.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets          = [aws_subnet.abbas_public_1.id, aws_subnet.abbas_public_2.id]
    assign_public_ip = true
    security_groups  = [aws_security_group.abbas_sg.id]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.abbas_tg.arn
    container_name   = "my-app"
    container_port   = 3000
  }

  health_check_grace_period_seconds = 60

  depends_on = [aws_lb_listener.https_listener]
}

resource "aws_s3_bucket" "abbas_bucket" {
  bucket        = "abbas-tmapp"
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "abbas_bucket_block" {
  bucket                  = aws_s3_bucket.abbas_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
resource "aws_route53_zone" "tmapp" {
  name = "tmapp.abbashussein.com"
  force_destroy = true
}

resource "aws_route53_record" "tmapp_alias" {
  zone_id = aws_route53_zone.tmapp.zone_id
  name    = ""
  type    = "A"
  
  alias {
    name                   = aws_lb.abbas_alb.dns_name
    zone_id                = aws_lb.abbas_alb.zone_id
    evaluate_target_health = true
  }
}


