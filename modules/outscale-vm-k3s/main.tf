resource "outscale_keypair" "quickstart_key_pair" {
  keypair_name = "${var.prefix}-rancher-quickstart"
  public_key   = var.ssh_public_key
}

resource "outscale_security_group" "rancher_sg_allowall" {
  security_group_name = "${var.prefix}-rancher-allowall"
  description         = "Rancher quickstart - allow all traffic"

  tags {
    key   = "creator"
    value = "rancher-quickstart"
  }
}

resource "outscale_security_group_rule" "security_group_rule01" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.rancher_sg_allowall.id
  rules {
    from_port_range = "0"
    to_port_range   = "0"
    ip_protocol     = "-1"
    ip_ranges       = ["0.0.0.0/0"]
  }
}

resource "outscale_public_ip" "rancher_server" {
}

resource "outscale_public_ip_link" "rancher_server" {
  vm_id     = outscale_vm.rancher_server.vm_id
  public_ip = outscale_public_ip.rancher_server.public_ip

  provisioner "remote-exec" {
    inline = [
      "echo 'Waiting for cloud-init to complete...'",
      "cloud-init status --wait > /dev/null",
      "echo 'Completed cloud-init!'",
    ]

    connection {
      type        = "ssh"
      host        = outscale_public_ip.rancher_server.public_ip
      user        = var.node_username
      private_key = var.ssh_private_key_pem
    }
  }
}

resource "outscale_vm" "rancher_server" {
  image_id           = var.omi
  vm_type            = var.instance_type
  keypair_name       = outscale_keypair.quickstart_key_pair.keypair_name
  security_group_ids = [outscale_security_group.rancher_sg_allowall.security_group_id]
  user_data          = filebase64(join("/", [path.module, "files/userdata_rancher_server"]))

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
    value = "${var.prefix}-rancher-server"
  }

  tags {
    key   = "creator"
    value = "rancher-quickstart"
  }

  tags {
    key   = "osc.fcu.eip.auto-attach"
    value = outscale_public_ip.rancher_server.public_ip
  }
}
