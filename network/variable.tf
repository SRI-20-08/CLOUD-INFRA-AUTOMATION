/*
Default values
*/

variable "env" {
    description = "Environment name"
}

variable "iprange"{
  description = "Value of the Ip range that is going to be used, must be in the following format 10.X.0.0/21"
}

# variable "az1" {
#     description = "first az"
# }

# variable "az2" {
#     description = "second az"
# }

# variable "clientname" {
#     description = "Introduce the client name, if the domain will be *.invk.cloud, you must introduce the *."
# }


# variable "keypair" {
#     description = "KeyPair that was created on AWS before running this (located under EC2-Keypairs)."
# }

# variable "instancetype" {
#     description = "Default Instance Type for instances"
# }

# variable "amiid" {
#     description = "ami used for deploying windows instances, shared from CNTRL NA"
# }


# /*
# Networking
# */



# variable "gpeu" {
#     description = "Global Protect Ip range for EU"
# }

# variable "gpna" {
#     description = "Global Protect Ip range for NA"
# }

# variable "ctrl-na" {
#     description = "Control NA"
# }

# variable "vuln-scanner" {
#     description = "Vulnerabilities scanner"
# }

# variable "domainname"{
#   description = "Value of the domain name that is going to be created: *.invk.cloud where * is the client name."
# }

# variable "transit-gateway-net-sec"{
#   description = "ID of the tgw shared from net-sec account"
# }

# /*
# Instances Names
# */

# variable "dc" {
#   description = "Value of the Name tag for the EC2 instance"
# }

# variable "appserver" {
#   description = "Value of the Name tag for the EC2 instance"
# }

# variable "intc" {
#   description = "Value of the Name tag for the EC2 instance"
# }

# variable "prodbot" {
#   description = "Value of the Name tag for the EC2 instance"
# }

# variable "qabot" {
#   description = "Value of the Name tag for the EC2 instance"
# }

# /*
# Number of instances
# */

# variable "intcnumber" {
#   description = "Number of INTCs you want to deploy"
#   type = number
# }

# variable "appservernumber" {
#   description = "Number of Application Servers you want to deploy"
#   type = number
# }

# variable "robotnumber" {
#   description = "Number of Robots you want to deploy"
#   type = number
# }

# variable "qabotnumber" {
#   description = "Number of QaBots you want to deploy"
#   type = number
# }




# /*
# Add more variables here below
# */

# /*
# variable "ActiveDirectory" {
#   description = "Value of the Name tag for the EC2 instance"
#   type        = string
#   default     = "ActiveDirectory"
# }
# */

# /*
# rds
# */

# variable "rdsengine" {
#   description = "engine used for the RDS"
# }

# variable "rdsengineversion" {
#   description = "RDS version"
# }

# variable "rdsinstanceclass" {
#   description = "Instance type for the RDS"
# }

# variable "rdsusername" {
#   description = "Master user for the database"
# }

# variable "rdspassword" {
#   description = "Introduce the Password that is going to be used for the admin account of the database"
# }

# variable "rds_parameter_group" {
#   description = "Parameter group of the RDS"
# }

# variable "rds_subnet_group" {
#   description = "Subnet groups RDS"
# }

# variable "rds_min_space" {
#   description = "Introduce the minimum amount of space that is needed for the RDS, the recommended is 250"
# }

# variable "rds_max_space" {
#   description = "Introduce the maximum amount of space that is needed for the RDS, the recommended is 500"
# }