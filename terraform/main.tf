resource "aws_key_pair" "wordpress_key" {
  key_name   = var.key_pair_name
  public_key = file(var.public_key_path)
}

resource "aws_security_group" "wordpress_sg" {
  name        = "wordpress-sg"
  description = "Allow SSH, HTTP, HTTPS"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "wordpress_host" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.wordpress_key.key_name
  vpc_security_group_ids      = [aws_security_group.wordpress_sg.id]

  tags = {
    Name = "wordpress-ec2"
  }

  provisioner "remote-exec" {
    inline = ["sudo apt update"]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("C:/Users/Adede/.ssh/id_rsa")
      host        = self.public_ip
    }
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}
