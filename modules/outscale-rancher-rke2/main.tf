# creates RKE2 cluster (ref. https://registry.terraform.io/providers/rancher/rancher2/latest/docs/resources/cluster_v2)
resource "rancher2_cluster_v2" "quickstart_workload" {
  name               = var.workload_cluster_name
  kubernetes_version = var.workload_kubernetes_version
}

resource "outscale_keypair" "quickstart_key_pair" {
  keypair_name = "${var.prefix}-rancher-quickstart"
  public_key   = var.ssh_public_key
}

resource "outscale_public_ip" "quickstart_node" {
}

resource "outscale_vm" "quickstart_node" {
  image_id           = var.omi
  vm_type            = var.instance_type
  keypair_name       = outscale_keypair.quickstart_key_pair.keypair_name
  security_group_ids = [var.security_group_id]

  user_data = base64encode(templatefile(
    join("/", [path.module, "files/userdata_node.template"]),
    {
      username         = var.node_username
      register_command = rancher2_cluster_v2.quickstart_workload.cluster_registration_token[0].insecure_node_command
      # hint: insecure_windows_node_command for Windows
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
      user        = var.node_username
      private_key = var.ssh_private_key_pem
    }
  }
}
