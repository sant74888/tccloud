resource "aws_instance" "webserver" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.sshgroup.id]
  #vpc_security_group_ids = [aws_security_group.webserver-ssh.id]
  tags = {
    Name = "webserver"
  }
   key_name = data.aws_key_pair.webserverkey.id
}
data "aws_key_pair" "webserverkey" {
name ="webserver-key"
}
variable "ami" {}
variable "instance_type" {}
variable "secret_key" {}
variable "access_key" {}
#resource "aws_security_group" "webserver-ssh" {
 # name        = "SSH inbound"
 # description = "Allow SSH inbound traffic"
  #vpc_id      = "vpc-9e7be5e3"

  #ingress {
   # description      = "TLS from VPC"
   # from_port        = 22
   # to_port          = 22
   # protocol         = "tcp"
   # cidr_blocks      = ["0.0.0.0/0"]
   # #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  #}
#}
data "aws_security_group" "sshgroup" {
name ="SSH INBOUND"
}
#resource "aws_key_pair" "webserverkey" {
 # key_name   = "webserver-key"
#  public_key = file("key.pub")
#}
output publicip {
value= aws_instance.webserver.public_ip
}
#terraform {
#  backend "s3" {
#    bucket = "sant-test-bucket"
#    key    = "terraform.tfstate"
#    region = "ap-south-1"
#  }
#}
