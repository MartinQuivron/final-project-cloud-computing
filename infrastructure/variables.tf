variable "username_db" {
  description = "Username for the database"
  type        = string
}

variable "password_db" {
  description = "Password for the database"
  type        = string
  sensitive = true
}

variable "subscription_id" {
  description = "Subscription ID"
  type        = string
}

variable "location" {
  description = "Region for resources"
  type        = string
  default     = "France Central"
}

variable "resource_group_name" {
  description = "Name of resource group"
  type        = string
}

variable "vnet_adress_space" {
  description = "Address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_prefixes" {
  description = "Prefixes for the subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0"]
}

variable "docker_registry_url" {
  description = "URL of the docker registry"
  type        = string
  default = "https://ghcr.io"
}

variable "docker_image" {
  description = "Docker image"
  type        = string
  default     = "ghcr.io/martinquivron/final-project-cloud-computing/release_image:latest"
}

variable "docker_registry_username" {
  description = "Username for the docker registry"
  type        = string
  default     = "MartinQuivron"
}

variable "docker_registry_password" {
  description = "Password for the docker registry"
  type        = string
  sensitive = true
}