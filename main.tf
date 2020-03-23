provider "ibm" {
  iaas_classic_username = "${var.iaas_classic_username}"
  iaas_classic_api_key  = "${var.ibmcloud_iaas_api_key}"
}
resource "ibm_compute_vm_instance" "vm1" {
  hostname             = "${var.hostname}"
  domain               = "${var.domain}"
  os_reference_code    = "WIN_2012-STD_64"
  datacenter           = "dal09"
  network_speed        = 100
  # Para cambiar de consumo por hora a mes poner hourly_billing = false
  hourly_billing       = true
  private_network_only = true
  cores                = "${var.cores}"
  memory               = "${var.memory}"
  disks                =  100
  local_disk           = false

  private_subnet = "${var.private_subnet}"
}
