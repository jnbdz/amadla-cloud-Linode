# Linode

variable "server_image_name" {
   type    = string
   default = env("SERVER_IMAGE_NAME")
}

variable "server_image_descr" {
   type    = string
   default = env("SERVER_IMAGE_DESCR")
}

variable "api_token" {
   type    = string
   default = env("LINODE_API_TOKEN")
}

variable "ansible_playbook_path" {
  type    = string
  default = env("ANSIBLE_PLAYBOOK_PATH")
}

locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

source "linode" "amadla-base-server" {
   linode_token      = "${var.api_token}"
   instance_label    = "${var.server_image_name}${local.timestamp}"
   image_label       = "${var.server_image_name}${local.timestamp}"
   image_description = "${var.server_image_descr}"
   image             = "linode/debian10"
   instance_type     = "g6-nanode-1"
   region            = "us-east"
   ssh_username      = "root"
}

build {
  sources = ["source.linode.amadla-base-server"]

  provisioner "shell" {
    inline = [
      "sleep 30", # Give some time for the server to start
      "mkdir -p /root/.amadla", # This is the hidden directory that is used to transfer files for Amadla in the server
      "mkdir -p /root/.amadla/secrets" # This is where sensitive informations like keys are set
    ]
  } 

  provisioner "file" {
    destination = "/root/.amadla/secrets/id_ed25519.pub" # The destination the users ssh public key must go to
    source      = "/home/jn/.ssh/id_ed25519.pub" # The source of the ssh public key
  }

  provisioner "ansible" {
    use_proxy     = false
    playbook_file = "${var.ansible_playbook_path}"
  } 

}
