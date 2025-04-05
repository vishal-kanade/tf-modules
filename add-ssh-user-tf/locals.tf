locals {
  public_keys = [
    for index, username in var.usernames :
    tls_private_key.user_keys[index].public_key_openssh
  ]

  run_commands = join("\",\"", [
    for index, username in var.usernames :
    "echo '${replace(tls_private_key.user_keys[index].public_key_openssh, "\n", "")} ${username}' >> /root/.ssh/authorized_keys"
  ])
}