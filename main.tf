
# Create instances for app nodes 
resource "aws_instance" "app_nodes" {
  count = var.node_count
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name  = var.key_name 
  user_data = <<-EOT
    #!/bin/bash -x
    curl -sL https://releases.rancher.com/install-docker/${var.docker_version}.sh | sh
    sudo usermod -aG docker ubuntu
    cat <<EOF > /etc/docker/daemon.json
  EOT
  security_groups = [data.aws_security_group.app_cluster_sg.id]

  root_block_device {
    volume_type = "gp2"
    volume_size = "50"
  }
  provisioner "remote-exec" {
    inline = [
      "cloud-init status --wait",
      "${rancher2_cluster.app_cluster.cluster_registration_token.0.node_command} --address  ${self.public_ip} --internal-address ${self.private_ip} --etcd --controlplane --worker"
    ]

    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      # private_key = file(var.ssh_key_file)
    }
  }

  tags = {
    "Name" = "rke_0${count.index}"
    "Owner" = "mbh"
    "DoNotDelete" = "true"
  }

  iam_instance_profile = var.cloud_provider_role
}
