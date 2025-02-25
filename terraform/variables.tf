variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "harness_account_id" {
  description = "Harness Account ID"
  type        = string
  default     = ""
}

variable "harness_delegate_token" {
  description = "Harness Delegate Token"
  type        = string
  default     = ""
}

variable "harness_manager_endpoint" {
  description = "Harness Manager Endpoint"
  type        = string
  default     = ""
}
