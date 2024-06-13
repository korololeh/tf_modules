output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr" {
  value = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnets[*].id
}

output "server_sg_id" {
  value = aws_security_group.server.id
}

output "server_public_ip" {
  value = aws_instance.jenkins_server.public_ip
}
