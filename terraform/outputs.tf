output "public_ip" {
  value = aws_instance.wordpress_host.public_ip
  description = "Public IP of the WordPress EC2 instance"
}

output "inventory_format" {
  value = <<EOT
[wordpress]
${aws_instance.wordpress_host.public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_rsa
EOT
}
