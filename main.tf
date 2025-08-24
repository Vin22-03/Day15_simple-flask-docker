provider "aws" {
  region = "us-east-1"
}

# IAM Role for ECS Tasks to pull image from ECR
resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskExecutionRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach the ECS execution policy to the role
resource "aws_iam_role_policy_attachment" "ecs_execution_role_attach" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

# ECS Task Definition (based on your Docker image)
resource "aws_ecs_task_definition" "vin_task" {
  family                   = "vin-flask-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = "vin-flask-container"
      image     = "921483785411.dkr.ecr.us-east-1.amazonaws.com/day15-flask-ecr:latest"
      essential = true
      portMappings = [
        {
          containerPort = 5000
          hostPort      = 5000
          protocol      = "tcp"
        }
      ]
    }
  ])
}

# ECS Cluster
resource "aws_ecs_cluster" "vin_cluster" {
  name = "vin-flask-cluster"
}

# ECS Service (runs your task in the cluster)
resource "aws_ecs_service" "vin_service" {
  name            = "vin-flask-service"
  cluster         = aws_ecs_cluster.vin_cluster.id
  launch_type     = "FARGATE"
  desired_count   = 1
  task_definition = aws_ecs_task_definition.vin_task.arn

  network_configuration {
    subnets          = ["subnet-00bad57e7b801e018", "subnet-06722bf9000a42be6"]     # ⚠️ Replace
    assign_public_ip = true
    security_groups  = ["sg-01b4bb81bf6060a1e"]                                # ⚠️ Replace
  }
}
