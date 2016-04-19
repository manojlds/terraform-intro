provider "aws" {
  region = "${var.region}"
}

resource "aws_instance" "instance" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
}

resource "template_file" "ansible_inventory" {
  template = "${file("${path.root}/templates/ansible.inventory.tpl")}"

  vars {
    server_private_ip = "${aws_instance.instance.private_ip}"
  }

  provisioner "local-exec" {
    command = "cat << 'EOF' > ${path.root}/rendered/ansible.inventory\n${self.rendered}\nEOF"
  }
}
