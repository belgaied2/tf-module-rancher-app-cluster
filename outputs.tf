output "app_cluster_instance" {
    value = [
  	for instance in aws_instance.app_nodes: {
        public_ip  = instance.public_ip
        private_ip = instance.private_ip
        hostname   = instance.id
        user       = "ubuntu"
        # roles      = instance.tags != null && instance.tags.K8sRoles != null ? split(",", instance.tags.K8sRoles)  : []
    }
  ]
}

output "app_cluster_docker_bootstrap" {
  value = rancher2_cluster.app_cluster.cluster_registration_token.0.node_command
}