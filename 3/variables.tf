variable "region" {
  default = "eu-west-1"
}

variable "ami" {}

variable "instance_type" {
  description = "Instance type for our dummy instance"
}

variable "key_name" {
  default = "demo"
}

variable "public_key_path" {
  default = "~/.ssh/demo.pub"
}

variable "private_key_path" {
  default = "~/.ssh/demo.pem"
}

variable "subnet_id" {}
