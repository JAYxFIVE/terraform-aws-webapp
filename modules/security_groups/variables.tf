variable "project_name" {
  description = "Project name prefix"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string

  validation {
    condition     = contains(["dev","prod"], var.environment)
    error_message = "Environment must be either 'dev' or 'prod'"
  }
}

variable "my_ip" {
  description = "Your public IP in CIDR form for SSH, example 1.2.3.4/32"
  type        = string
}

variable "vpc_id" {
  type = string
}