data "aws_ami" "latest_amazon_linux" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

#=====================================================================

resource "aws_instance" "jenkins_server" {
  ami                    = data.aws_ami.latest_amazon_linux.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.server.id]
  subnet_id              = aws_subnet.public_subnets[0].id
  key_name               = var.aws_pair_key_name
  tags = {
    Name = "Jenkins server"
  }
}

resource "aws_security_group" "server" {
  name   = "Server Security Group"
  vpc_id = aws_vpc.main.id

  dynamic "ingress" {
    for_each = ["80", "443", "22", "8080"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "servers-sg"
  }
}

#=====================================================================
