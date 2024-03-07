# Configure variables
variable "tenant_id" {
  type        = string
  description = "Tenant ID"
}

variable "client_id" {
  type        = string
  description = "Terraform Service Principal client ID"
}

variable "client_secret" {
  type        = string
  description = "Terraform Service Principal client secret"
}