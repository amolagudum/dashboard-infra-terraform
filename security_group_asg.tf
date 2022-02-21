resource "aws_security_group" "allow_http_asg" {
  name        = var.asg_security_group_name
  description = "Allow HTTP inbound traffic from LB"

  ingress {
    #http
    from_port       = 8080
    to_port         = 8080
    protocol        = "TCP"
    security_groups = [aws_security_group.allow_http.id]
    description     = "allow http inbound"
  }

  ingress {
    #http
    from_port       = 3306
    to_port         = 3306
    protocol        = "TCP"
    security_groups = ["sg-00ad69f4112659dec"]
    description     = "allow RDS inbound"
  }

  ingress {
    #http
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow http inbound"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow all traffic outbound"
  }
}