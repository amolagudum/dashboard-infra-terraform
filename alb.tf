resource "aws_alb" "dashboard_alb" {
  name               = "dasboard-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_http.id]
  subnets            = data.aws_subnet_ids.selected.ids

  tags = {
    Environment = "Dev"
  }
}

resource "aws_alb_target_group" "dashboard_target_group" {
  name     = "dashboard-tg"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.selected.id
  health_check {
    port     = 8080
    protocol = "HTTP"
    path = "/CrudDemoWithMySql/"
  }
}

resource "aws_alb_listener" "front_end" {
  load_balancer_arn = aws_alb.dashboard_alb.arn
  port              = "8080"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.dashboard_target_group.arn
  }
}

resource "aws_alb_listener" "front_end_https" {
  load_balancer_arn = aws_alb.dashboard_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:ap-south-1:673596997607:certificate/6a84a8d0-81f3-4ad8-ad01-0d6ae1484444"
  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.dashboard_target_group.arn
  }
}

