provider "linode" {
  token = var.linode_token
}

locals {
  instances = var.instances
}

resource "linode_instance" "example" {
  count = length(local.instances)

  label = local.instances[count.index].label
  image = local.instances[count.index].image
  type = local.instances[count.index].type
  region = local.instances[count.index].region
  authorized_keys = [var.ssh_public_key]

  provisioner "remote-exec" {
    inline = [
      "ansible-playbook ${local.instances[count.index].ansible_playbook_path}"
    ]
  }
}

variable "linode_token" {
  type = string
}

variable "ssh_public_key" {
  type = string
}

variable "instances" {
  type = list(object({
    label = string
    image = string
    type = string
    region = string
    ansible_playbook_path = string
    ssh_public_key = string
  }))
}