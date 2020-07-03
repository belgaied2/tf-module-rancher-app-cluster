variable "node_count" {
  type = number
  description = "This is the number of nodes desired in the application cluster"
  default     = 3   
}

variable "aws_access_key" {
  type        = string
  description = "AWS access key used to create infrastructure"
}

# Required
variable "aws_secret_key" {
  type        = string
  description = "AWS secret key used to create AWS infrastructure"
}

variable "aws_region" {
  type        = string
  description = "AWS region used for all resources"
  default     = "eu-central-1"
}

variable "docker_version" {
  description = "Version of Docker to install on provisioned machines"
  default     = "19.03.4"
}

variable "key_name" {
  description = "Key Pair Name to use for the instances"
  default     = ""
}

variable "api_url" {
  description = "description"
}

variable "token_key" {
  description = "description"
}

variable "security_group_name" {
  description = "Security group name for downstream clusters"
}

variable "instance_type" {
  description = "AWS Instance Type to create for App Clusters"
  default     = "t3a.large"
}





