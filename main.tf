resource "ibm_compute_vm_instance" "vm1" {
  hostname             = "tfwin1"
  domain               = "tfdemo.com"
  os_reference_code    = "WIN_2012-STD_64"
  datacenter           = "dal09"
  network_speed        = 100
  # Para cambiar de consumo por hora a mes poner hourly_billing = false
  hourly_billing       = true
  private_network_only = true
  cores                = 1
  memory               = 2048
  disks                = [100]
  local_disk           = false

  private_subnet = "10.153.79.128/26"
  
}