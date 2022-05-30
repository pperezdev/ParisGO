variable "region" {
  description = "Default region for provider"
  type        = string
  default     = "us-east-1"
}

variable "AWS_ACCESS_KEY_ID" {
  description = "acess key of aws"
  type        = string
  default     = ""
  sensitive   = true
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "aws secret"
  type        = string
  default     = ""
  sensitive   = true
}