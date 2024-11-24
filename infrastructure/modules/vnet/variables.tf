variable "location" {
  description = "Region for resources"
  type        = string
  default     = "France Central"
}

variable "resource_group_name" {
  description = "Name of resource group"
  type        = string
}

variable "subnet_prefixes" {
  description = "Prefixes for the subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "random_id" {
  description = "Random ID"
  type        = string
}

variable "subnet_id_app_service" {
  description = "ID of the subnet for the app service"
  type        = string
}