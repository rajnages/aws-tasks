resource "aws_instance" "Web-Server" {
  count                  = length(var.public_subnet_ids)
  ami                    = var.ami
  instance_type          = var.aws_insrance_type
  key_name               = var.key_name
  subnet_id              = var.public_subnet_ids[count.index]
  vpc_security_group_ids = [var.security_group_id]
  tags = {
    Name = "Web-Server-${count.index + 1}"
  }
  lifecycle {
    create_before_destroy = false
  }
}
