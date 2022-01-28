resource "aws_security_group" "allow_http" {
  name        = var.security_group_name
  description = "Allow HTTP inbound traffic,Allow all outbound traffic"

  ingress {
    #http
    from_port   = 8080
    to_port     = 8080
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow http inbound"
  }

  ingress {
    #http
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow https inbound"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow all traffic outbound"
  }
}