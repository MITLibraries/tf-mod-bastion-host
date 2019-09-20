variable "allowed_cidr" {
  description = "A list of CIDR Networks to allow ssh access to."
  type        = list(string)

  default = [
    "0.0.0.0/0",
  ]
}

variable "logzio_token" {
  description = "Logz.io token secret"
  type        = string
}

variable "allowed_ipv6_cidr" {
  description = "A list of IPv6 CIDR Networks to allow ssh access to."
  type        = list(string)

  default = [
    "::/0",
  ]
}

variable "allowed_security_groups" {
  description = "A list of Security Group ID's to allow access to."
  type        = list(string)
  default     = []
}

variable "name" {
  description = "Name (_e.g._ `app` or `wordpress`)"
  default     = "app"
}

variable "tags" {
  description = "Additional tags (e.g. `map('BusinessUnit','XYZ')`)"
  type        = map(string)
  default     = {}
}

variable "ami" {
  description = "Amazon AMI to use to create instance"
}

variable "instance_type" {
  description = "Instance Type (size)"
  default     = "t3.nano"
}

variable "instance_volume_size_gb" {
  description = "The root volume size, in gigabytes"
  default     = "8"
}

variable "iam_instance_profile" {
  description = "IAM instance profile to attach to ASG "
}

variable "user_data_file" {
  description = "Custom user created bash script to run on creation"
  default     = "user_data.sh"
}

variable "s3_bucket_name" {
  description = "S3 bucket containing public SSH keys"
}

variable "s3_bucket_uri" {
  description = "URI of pre-created S3 bucket"
  default     = ""
}

variable "enable_monitoring" {
  description = "Enable monitoring of EC2 instance"
  default     = "true"
}

variable "ssh_user" {
  description = "SSH user created to access EC2 instance"
  default     = "ec2-user"
}

variable "enable_hourly_cron_updates" {
  description = "Flag to enable/disable hourly cron checks for new SSH keys"
  default     = "false"
}

variable "keys_update_frequency" {
  description = "How often to update keys. A cron timespec or an empty string to turn off"
  default     = ""
}

variable "additional_user_data_script" {
  description = "Additional user-data script to run at the end"
  default     = ""
}

variable "region" {
  description = "AWS Region to use"
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "ID of the VPC where bastion host should be launched"
}

variable "security_group_ids" {
  description = "Comma seperated list of security groups to apply to the bastion."
  default     = ""
}

variable "subnet_ids" {
  default     = []
  description = "A list of subnet ids"
}

variable "eip" {
  description = "EIP to put into EC2 tag (can be used with scripts)"
  default     = ""
}

variable "associate_public_ip_address" {
  description = "Flag to auto-assign public IP to the instance"
  default     = false
}

variable "key_name" {
  description = "Launch configuration key name to be applied to created instance(s)"
  default     = ""
}

variable "apply_changes_immediately" {
  description = "Whether to apply the changes at once and recreate auto-scaling group"
  default     = false
}

