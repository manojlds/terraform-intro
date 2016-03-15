provider "aws" {
  region = "eu-west-1"
}
resource "aws_instance" "instance" {
  ami = "ami-1208b761"
  instance_type = "t1.micro"
}
