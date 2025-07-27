resource "aws_instance" "ec2" {
    ami                 = var.aminame                  #data.aws_ami.ami.id
    instance_type       = var.inst_type
    tags                = merge({ "Name" = var.hostname }, var.billing_tags)
    volume_tags         = merge({ "Name" = var.hostname }, var.billing_tags)
    disable_api_termination = var.api_termination
    vpc_security_group_ids  = data.aws_security_group.app_sgs[*].id
    subnet_id               = data.aws_subnet.subnetdata.id
    associate_public_ip_address = var.public_ip_pool
    private_ip                  = var.private_ip
    user_data                   = var.userdata_template == null ? null : data.template_file.userdata[0].rendered
    iam_instance_profile        = var.instanceprofile
    instance_initiated_shutdown_behavior = var.instance_shutdown_behavior
    key_name                             = var.key_name
    get_password_data                    = var.windows_password_true

    root_block_device   {
        volume_type = var.root_type
        volume_size = var.root_size
        encrypted   = "true"
        iops        = var.root_type == "gp3" ? null : var.root_iops
        kms_key_id  = data.aws_kms_key.current.arn

    }                  
}


output "pvt_ip" {
    value = aws_instance.ec2.private_ip
}

output "InstanceId" {
    value = aws_instance.ec2.id
}

output "InstanceAz" {
    value = aws_instance.ec2.availability_zone
}

output "windowspass" {
    value = var.windows_password_true == true ? aws_instance.ec2.password_data : "Not a windows Instance"
}

resource "aws_ebs_volume" "ec2_additional_ebs" {
    for_each = var.additional_ebs_details
    availability_zone = aws_instance.ec2.availability_zone
    encrypted         = true
    size              = each.value["devicesize"]
    type              = lookup(each.value, "devicetype", "gp3")

    tags              = merge({ "Name" = var.hostname}, var.billing_tags)
    kms_key_id        = data.aws_kms_key.current.arn
    iops              = lookup(each.value, "iops", null)


}

resource "aws_volume_attachment" "ec2_additional_ebs_attach" {
    for_each = var.additional_ebs_details

    device_name = each.key
    volume_id   = aws_ebs_volume.ec2_additional_ebs[each.key].id
    instance_id = aws_instance.ec2.id
    stop_instance_before_detaching = true
}

output "ec2_vols_ids" {
    value = [ for i in aws_ebs_volume.ec2_additional_ebs : i.id]
}