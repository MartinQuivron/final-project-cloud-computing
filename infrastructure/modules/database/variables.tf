variable "username_db" {
  description = "Username for the database"
  type        = string
}

variable "password_db" {
  description = "Password for the database"
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

variable "random_id" {
  description = "Random ID"
  type        = string
}