
data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["turnkey-tomcat-apache-19.0.20261104-security-refresh-r2-prod-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["679593333241"]
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.app_ami.id
  instance_type = var.instance_type

  tags = {
    Name = "HelloWorld"
  }
}
