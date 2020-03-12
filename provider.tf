variable "iaas_classic_username" {
    default = "ibmjyamaniha-imc"
}
variable "ibmcloud_iaas_api_key" {
    default = "0670ca8289f165d2293fe72402422d671caeab4a80101ce0cd9de2d560661a49"
}

provider "ibm" {
  iaas_classic_username = "${var.iaas_classic_username}"
  iaas_classic_api_key  = "${var.ibmcloud_iaas_api_key}"
}