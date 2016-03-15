provider "aws" {
  region = "${var.region}"
}

resource "aws_key_pair" "demo" {
  key_name   = "${var.key_name}"
  public_key = "${file(var.public_key_path)}"
}

resource "aws_instance" "instance" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  associate_public_ip_address = true
  key_name = "${aws_key_pair.demo.id}"
  subnet_id = "${var.subnet_id}"

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get -y update",
      "sudo apt-get -y install nginx",
      "sudo service nginx start"
    ]

    connection {
      user = "ubuntu"
      private_key = "${file(var.private_key_path)}"
    }
  }
}
