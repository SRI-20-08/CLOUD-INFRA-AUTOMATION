aws_account = ""
aws_region  = "ap-south-1a"

billing_tags = {
    "project"       = "miniproject"
    "users"       = "ksc"
}

server_cidr = "10.0.2.0/24"

server_aminame = "ami-0b48565080da55df0"

server_sglist = [
    "Allow Internal"
]

username = "sony\\oktasync"
domain = "sony.invk.cloud"
ou = "OU=INTC,OU=Computers,OU=BluePrism,DC=sony,DC=invk,DC=cloud"
adpass = "Zxcvbnm123!"