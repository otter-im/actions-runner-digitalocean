variable "do_token" {}

variable "environment" {
  type = string
  description = "Development/Staging/Production"
  default = "Development"
}

variable "ssh_public_key" {
  type = string
  description = "Local SSH key file location on disk"
}

variable "instance_name" {
  type = string
  description = "Instance name not including the index suffix"
  default = "otter-gh-actions"
}

variable "instance_region" {
  type = string
  description = "DigitalOcean region"
}

variable "instance_size" {
  type = string
  description = "DigitalOcean instance size"
  default = "s-1vcpu-1gb"
}

variable "instance_count" {
  type = number
  description = "Number of instances to provision"
  default = 1
}
