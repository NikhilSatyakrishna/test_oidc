variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "app_name" {
  type    = string
  default = "OIDC"
}

variable "gh_organisation" {
  type        = string
  description = "Name of the Github Org"
  default     = "inikhiladitya"
}

