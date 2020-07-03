# App Cluster Module for Rancher2 provider
This repo shows an example module for Terraform Rancher2 provider that creates an Application Cluster with its nodes in AWS.

## Inputs

These are the module's input:
- node_count (Optional)
  - type : number
  - default     : 3
  - description :  


- aws_access_key (Optional)
    - type        : string
    - description : AWS access key used to create infrastructure


- aws_secret_key (Optional)
  - type        : string
  - description : WS secret key used to create AWS infrastructure


- aws_region (Optional)
  - type        : string
  - description : AWS region used for all resources
  - default     : eu-central-1


- docker_version (Optional)
  - description : Version of Docker to install on provisioned machines
  - default     : 19.03.4


- key_name (Optional)
  - type : string
  - description : Key Pair Name to use for the instances
  - default     : You default in AWS


- api_url (Required)
  - type : string
  - description : Rancher's API URL, e.g. https://rancher.domain.com/v3


- token_key (Required)
  - type: string
  - description : Your Rancher user's API token


- security_group_name (Required)
  - description : Security group name for downstream clusters


- instance_type (Optional)
  - description : "AWS Instance Type to create for App Clusters, minimum 2vCPU and 8 GiB RAM recommended"
  - default     : "t3a.large"


## Outputs
These are the outputs that this module gives back:
```
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
```