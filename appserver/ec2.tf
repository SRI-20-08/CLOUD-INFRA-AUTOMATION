module "appserver" {
    source = "D:/learn/terraform/terraform-aws/appserver/modules/ec2"
    server_cidr         = var.server_cidr
    aminame             = var.server_aminame
    app_sglist          = var.server_sglist
    inst_type           = "t2.micro"
    billing_tags        = merge(var.billing_tags)
    root_type           = "gp3"
    root_size           = "100"
    #additional_ebs_details = { "/dev/xvdc" : { "devicesize" : "70", "devicetype" : :gp3 }}
    userdata_template   = file("./appserver.tpl")
    userdata_vars = {
        "shorthostname" = "appserver",
        "username"      = "${var.username}",
        "domain"        = "${var.domain}",
        "ou"            = "${var.ou}",
        #adpass          = data.vault_generic_secret.hq_awsinstaller.data["current_password"]
        adpass          = "${var.adpass}"
    }

    hostname = "appserver"
    
    
}

output "appserver" {
    value = <<EOF
    Instance Id: "${module.appserver.InstanceId}"
    Private IP:  "${module.appserver.pvt_ip}"
    InstanceAZ:  "${module.appserver.InstanceAz}"
        EOF
}

output "password" {
    value = "${rsadecrypt(module.appserver.windowspass, file("terraformkey.pem"))}"
}