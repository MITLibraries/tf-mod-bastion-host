A Terraform module for creating resilient bastion host using auto-scaling group (min=max=desired=1) and populate its ~/.ssh/authorized_keys with public keys fetched from S3 bucket.

This module can append public keys, setup cron to update them and run additional commands at the end of setup.

_Note: removing a key from the bucket will also remove it from the bastion host._

_Only SSH access is allowed to the bastion host._

This module is originally from [here](https://github.com/terraform-community-modules/tf_aws_bastion_s3_keys) and has been modified to fit our needs.

## Inputs

| Name                        | Description                                                              |  Type  |     Default    | Required |
| --------------------------- | ------------------------------------------------------------------------ | :----: | :------------: | :------: |
| additional_user_data_script | Additional user-data script to run at the end                            | string |        "       |    no    |
| allowed_cidr                | A list of CIDR Networks to allow ssh access to.                          |  list  |    `<list>`    |    no    |
| allowed_ipv6_cidr           | A list of IPv6 CIDR Networks to allow ssh access to.                     |  list  |    `<list>`    |    no    |
| allowed_security_groups     | A list of Security Group ID's to allow access to.                        |  list  |    `<list>`    |    no    |
| ami                         | Amazon AMI to use to create instance                                     | string |        -       |    yes   |
| apply_changes_immediately   | Whether to apply the changes at once and recreate auto-scaling group     | string |     `false`    |    no    |
| associate_public_ip_address | Flag to auto-assign public IP to the instance                            | string |     `false`    |    no    |
| eip                         | EIP to put into EC2 tag (can be used with scripts)                       | string |        "       |    no    |
| enable_hourly_cron_updates  | Flag to enable/disable hourly cron checks for new SSH keys               | string |     `false`    |    no    |
| enable_monitoring           | Enable monitoring of EC2 instance                                        | string |     `true`     |    no    |
| iam_instance_profile        | IAM instance profile to attach to ASG                                    | string |        -       |    yes   |
| instance_type               | Instance Type (size)                                                     | string |    `t3.nano`   |    no    |
| instance_volume_size_gb     | The root volume size, in gigabytes                                       | string |       `8`      |    no    |
| key_name                    | Launch configuration key name to be applied to created instance(s)       | string |        "       |    no    |
| keys_update_frequency       | How often to update keys. A cron timespec or an empty string to turn off | string |        "       |    no    |
| logzio_token                | Logz.io token secret                                                     | string |        -       |    yes   |
| name                        | Name (_e.g._ `app` or `wordpress`)                                       | string |      `app`     |    no    |
| region                      | AWS Region to use                                                        | string |   `us-east-1`  |    no    |
| s3_bucket_name              | S3 bucket containing public SSH keys                                     | string |        -       |    yes   |
| s3_bucket_uri               | URI of pre-created S3 bucket                                             | string |        "       |    no    |
| security_group_ids          | Comma seperated list of security groups to apply to the bastion.         | string |        "       |    no    |
| ssh_user                    | SSH user created to access EC2 instance                                  | string |   `ec2-user`   |    no    |
| subnet_ids                  | A list of subnet ids                                                     |  list  |    `<list>`    |    no    |
| tags                        | Additional tags (e.g. `map('BusinessUnit','XYZ')`)                       |   map  |     `<map>`    |    no    |
| user_data_file              | Custom user created bash script to run on creation                       | string | `user_data.sh` |    no    |
| vpc_id                      | ID of the VPC where bastion host should be launched                      | string |        -       |    yes   |

## Outputs

| Name              | Description                                                        |
| ----------------- | ------------------------------------------------------------------ |
| asg_id            | The ID of the AutoScalingGroup the bastion host is launched within |
| name              | Appname                                                            |
| security_group_id | ID of the security group the bastion host is launched in           |
| ssh_user          | SSH user to login to bastion                                       |
| tags              | Tags generated by label module to apply to other resources         |
