variable "server_cidr" {
    description = "CIDR Block of the subnet to Launch the Instance"
    type        = string
}

variable "aminame" {
    description =   "Name of AWS ami" 
    type        = string
}

variable "instanceprofile" {
    description = "The IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile"
    default     = null 
}

variable "app_sglist" {
    description = "List of security Groups to be applied to the APP"
    type        = list(string)
}

variable "hostname" {
    description = " Hostname of the Instance"
    type        = string
}

variable "inst_type" {
    description = "Type of Instance"
    type        = string
}

variable "billing_tags" {
    description = "Tags to be attached to the Instance for the billing"
    type        = map(string)
}

variable "root_size" {
    description = "size of the Root volume"
    type        = number
}

variable "root_type" {
    description = "Type of the Root volume"
    type        = string
    default     = "gp3"
}

variable "root_iops" {
    description = "Iops"
    type        = any
    default     = null
}

variable "userdata_template" {
    description = "The template file provided through the module along with the required variables"
    type        = string
    default     = "./appserver.tpl"
}

variable "userdata_vars" {
    description = "map with the keys and value for the vars to be rendered"
    type        = map(any)
    default     = null
}

variable "api_termination" {
    description = "If true, enables EC2 Instance Termination Protection"
    type        = bool
    default     = false
}

variable "public_ip_pool" {
    description = "Boolean Value to indicate if the public IP has to be assgined or not"
    type        = bool
    default     = false
}

variable "private_ip" {
    description = "Private Ip of the Instance left to AWS to assign by default"
    type        = string
    default     = null
}

variable "iam_instance_profile" {
    description = "The IAM Instance Profile to Launch with. Specified as the name of the iNstance Profile"
    type        = string
    default     = null
}

variable "key_name" {
    description = "The key name of the Key Pair to use for the instance"
    type        = string
    default     = "terraformkey"
}

variable "windows_password_true" {
    description = "If true, wait for the password data to become available and retrive it. Useful for getting the administrator password for the intances running windows"
    type        = bool
    default     = true
}

variable "instance_shutdown_behavior" {
    description = "Shutdown behavior for the instance. AWS defaults this to stop for EBS-backed instances and terminate for instance-store instances"
    type        = string
    default     = "stop"
}

variable "additional_ebs_details" {
    description = "Additional EBS Volume detals to be provided in the format of a map { devicename : { devicesize : 30 , devicetype: io1, iops: 3000}}"
    type        = map(map(string))
    default     = {}
}
