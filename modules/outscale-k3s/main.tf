resource "outscale_keypair" "default" {
  keypair_name = var.resource_prefix
  public_key   = var.ssh_public_key
}

resource "outscale_security_group" "allowall" {
  security_group_name = "${var.resource_prefix}-allowall"
  description         = "Allow all traffic"

  tags {
    key   = "creator"
    value = var.creator
  }
}

resource "outscale_security_group_rule" "inboundall" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.allowall.id
  rules {
    from_port_range = "0"
    to_port_range   = "0"
    ip_protocol     = "-1"
    ip_ranges       = ["0.0.0.0/0"]
  }
}

resource "outscale_public_ip" "default" {
}

resource "outscale_vm" "k3s_node" {
  image_id           = var.vm_image
  vm_type            = var.vm_type
  keypair_name       = outscale_keypair.default.keypair_name
  security_group_ids = [outscale_security_group.allowall.security_group_id]
  user_data          = filebase64(join("/", [path.module, "files/userdata_server"]))

  block_device_mappings {
    device_name = "/dev/sda1"
    bsu {
      volume_size = 15
      volume_type = "io1"
      iops        = 1500
    }
  }

  tags {
    key   = "name"
    value = "${var.resource_prefix}-k3s-node"
  }

  tags {
    key   = "creator"
    value = var.creator
  }

  tags {
    key   = "osc.fcu.eip.auto-attach"
    value = outscale_public_ip.default.public_ip
  }
}

resource "outscale_public_ip_link" "cloud_init" {
  vm_id     = outscale_vm.k3s_node.vm_id
  public_ip = outscale_public_ip.default.public_ip

  provisioner "remote-exec" {
    inline = [
      "echo 'Waiting for cloud-init to complete...'",
      "cloud-init status --wait > /dev/null",
      "echo 'Completed cloud-init!'",
    ]

    connection {
      type        = "ssh"
      host        = outscale_public_ip.default.public_ip
      user        = var.node_username
      private_key = var.ssh_private_key_pem
    }
  }
}
