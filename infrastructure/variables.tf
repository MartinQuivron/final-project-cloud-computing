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