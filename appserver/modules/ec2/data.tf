data "aws_subnet" "subnetdata" {
    cidr_block = var.server_cidr
}

data "aws_security_group" "app_sgs" {
    count = length(var.app_sglist)
    name  = var.app_sglist[count.index]
    vpc_id = data.aws_subnet.subnetdata.vpc_id
}

data "aws_kms_key" "current" {

    key_id = "alias/aws/ebs"
}

# data "aws_ami" "ami" {
#     most_recent = true
# }


data "template_file" "userdata" {

    count = var.userdata_template == null ? 0 : 1
    template = var.userdata_template
    vars     = var.userdata_vars == null ? {} : { for key, value in var.userdata_vars : key => value }
    
}