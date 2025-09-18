# environment variables
variable "region" {
    description = "region to create resources "
    type        = string
}

variable "project_name" {
    description = "project name "
    type        = string
}

variable "environment" {
    description = "environment"
    type        = string
}

# vpc variables
variable "vpc_cidr" {
    description = "vpc cidr block"
    type        = string
}

# public subnet az1 variables
variable "public_subnet_az1_cidr" {
    description = "public subnet az1 cidr"
    type        = string
}

# public subnet az2 variables
variable "public_subnet_az2_cidr" {
    description = "public subnet az2 cidr"
    type        = string
}

# private app subnet az1 variables
variable "private_app_subnet_az1_cidr" {
    description = "private app subnet az1 cidr"
    type        = string
}

# private app subnet az2 variables
variable "private_app_subnet_az2_cidr" {
    description = "private app subnet az2 cidr"
    type        = string
}

# private data subnet az1 variables
variable "private_data_subnet_az1_cidr" {
    description = "private data subnet az1 cidr"
    type        = string
}

 # private data subnet az2 variables
variable "private_data_subnet_az2_cidr" {
    description = "private data subnet az2 cidr"
    type        = string
}

# iam variables
variable "app_bucket" {
    description = "S3 app bucket name"
    type        = string
}



# rds variables
variable "db_username" { 
    description = "DB user name"
    type = string 
} 


variable "db_password" { 
    description = "DB password"
    type = string 

}
variable "db_name" { 
    description = "name of the database"
    type = string 

}
variable "subnet_ids" { 
    description = "subnets where the db is created"
    type = list(string) 

}
variable "vpc_security_group_ids" {
    description = "security group of the db" 
    type = list(string) 
}

# asg variables

variable "vpc_id" { 
    type = string 
}

variable "app_subnet_ids" { 
    type = list(string) 
}

variable "key_name" { 
    type = string 
}

variable "public_key_path" {
     type = string 
}

variable "ami_name_filter" {
     type = string 
}

variable "instance_type" { 
    type = string 
}

variable "asg_min_size" { 
    type = number 
}

variable "asg_max_size" { 
    type = number
}

variable "alb_target_group_arn" { 
    type = string 
}

variable "iam_instance_profile" { 
    type = string 
}

variable "security_group_ids" { 
    type = list(string) 
}

variable "app_repo" { 
    type = string 
}

variable "app_branch" { 
    type = string 
}

# security group variables
variable "admin_ssh_cidr" { 
    description = "ssh admin IP"
    type = string 
}