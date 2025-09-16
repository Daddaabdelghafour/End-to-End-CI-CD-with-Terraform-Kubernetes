# the values are in terraform.tfvars file
variable "my_ip_address" {
  description = "My IP address"
  type        = string
  sensitive   = true
}

variable "key_pair_name" {
  description = "My key pair name"
  type        = string
  sensitive   = true
}

variable "aws_access_key_id"{
    description = "my aws access key id"
    type = string
    sensitive = true
}


variable "aws_secret_access_key"{
    description = "my aws secret access key "
    type = string
    sensitive = true
}
