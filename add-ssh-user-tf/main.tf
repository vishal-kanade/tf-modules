resource "tls_private_key" "user_keys" {
  count     = length(var.usernames)
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_secretsmanager_secret" "user_keys" {
  count = length(var.usernames)
  name  = "/env/${var.environment}/ssh-keys/${var.usernames[count.index]}-key"
}

resource "aws_secretsmanager_secret_version" "user_keys" {
  count         = length(var.usernames)
  secret_id     = aws_secretsmanager_secret.user_keys[count.index].id
  secret_string = tls_private_key.user_keys[count.index].private_key_pem
}

resource "aws_key_pair" "user_keys" {
  count      = length(var.usernames)
  key_name   = "${var.usernames[count.index]}-key"
  public_key = tls_private_key.user_keys[count.index].public_key_openssh
}

resource "aws_ssm_document" "add_ssh_keys" {
  name          = var.ssm_document_name
  document_type = "Command"
  content       = templatefile("${path.module}/add-ssh-keys.tpl", { run_commands = local.run_commands })

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_ssm_association" "run_add_ssh_keys" {
  count = var.ec2_instance_id != null ? 1 : 0
  name  = aws_ssm_document.add_ssh_keys.name
  targets {
    key    = "InstanceIds"
    values = [var.ec2_instance_id]
  }
  wait_for_success_timeout_seconds = 60
}
