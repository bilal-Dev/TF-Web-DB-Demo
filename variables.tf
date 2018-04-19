variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-1"
}
variable "instance_count"{
default = 1
}
variable "environment" {
  description = "The name of the environment"
}

variable "health_check_type" {
  description = "EC2 or ELB. Controls how health checking is done"
}

variable "health_check_healthy_threshold" {
  description = "The number of checks before the instance is declared healthy"
}

variable "health_check_unhealthy_threshold" {
  description = " The number of checks before the instance is declared unhealthy"
}

variable "health_check_timeout" {
  description = "The length of time before the check times out"
}

variable "health_check_target" {
  description = " The target of the check. Valid pattern is $PROTOCOL:$PORT$PATH"
}

variable "health_check_interval" {
  description = "The interval between checks"
}
