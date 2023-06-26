resource "outscale_keypair" "quickstart_key_pair" {
  keypair_name = "${var.prefix}-rancher-quickstart"
  public_key   = tls_private_key.global_key.public_key_openssh
}

resource "outscale_public_ip" "quickstart_node" {
}

resource "outscale_public_ip_link" "quickstart_node" {
  vm_id     = outscale_vm.quickstart_node.vm_id
  public_ip = outscale_public_ip.quickstart_node.public_ip

  provisioner "remote-exec" {
    inline = [
      "echo 'Waiting for cloud-init to complete...'",
      "cloud-init status --wait > /dev/null",
      "echo 'Completed cloud-init!'",
    ]

    connection {
      type        = "ssh"
      host        = outscale_public_ip.quickstart_node.public_ip
      user        = local.node_username
      private_key = tls_private_key.global_key.private_key_pem
    }
  }
}

resource "outscale_vm" "quickstart_node" {
  image_id           = var.omi
  vm_type            = var.instance_type
  keypair_name       = outscale_keypair.quickstart_key_pair.keypair_name
  security_group_ids = [outscale_security_group.rancher_sg_allowall.security_group_id]

  user_data = base64encode(templatefile(
    join("/", [path.module, "files/userdata_quickstart_node.template"]),
    {
      username         = local.node_username
      register_command = module.rancher_common.custom_cluster_command
    }
  ))

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
    value = "${var.prefix}-quickstart-node"
  }

  tags {
    key   = "creator"
    value = "rancher-quickstart"
  }

  tags {
    key   = "osc.fcu.eip.auto-attach"
    value = outscale_public_ip.quickstart_node.public_ip
  }
}
