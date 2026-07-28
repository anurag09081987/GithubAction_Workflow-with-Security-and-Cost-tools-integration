 variable "vms" {
  type = map(object({
    nic_name = string
    rg_name = string
    location = string
    config_name = string
    subnet_name = string
    vm_name = string
    vnet_name = string
    pip_name = string
    admin_username = string
    admin_password = string
    vm_size = string
  }))
  }