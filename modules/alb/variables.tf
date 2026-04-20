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

variable "vpc_id" {
  type = string
}

variable "target_instance_id" {
  type = string
}

variable "alb_sg_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}