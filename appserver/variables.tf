variable "aws_account" {
    description = " The account into which resources should be deployed to"
}

variable "aws_region" {
    description = "The region in AWS for deployment"
}

variable "billing_tags" {
    type = map(string)
}

variable "server_cidr" {}

variable "server_aminame" {}

variable "server_sglist" {
    description = "Security groups for ws2019 test server ad join in UAT"
}

variable "username" {
    description = "domain admin username used for AD join"
}

variable "domain" {
    description = "Fully qualified domain name"
}

variable "ou" {
    description = "Complete ou address"
}

variable "adpass" {
    description = "domain admin account pass"
}

