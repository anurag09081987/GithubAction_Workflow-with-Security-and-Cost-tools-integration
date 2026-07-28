variable "resource_group" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "storage_account" {
  type = map(any)
}

variable "virtual_network" {
  type = map(object({
    name          = string
    resource_group_name        = string
    location      = string
    address_space = list(string)
  }))
}
variable "subnets"{
   type = map(object({
    name          = string
    resource_group_name        = string
    virtual_network_name      = string
    address_prefixes = list(string)
  }))
}

  variable "pip" {
    type = map(object({
    name = string
    resource_group_name = string
    location = string
    allocation_method = string
    }))
  }
  variable "virtual_machine" {
  type = map(object({
    nic_name = string
    rg_name = string
    location = string
    config_name = string
    subnet_name = string
    vnet_name = string
    pip_name = string
    admin_username = string
    admin_password = string
    vm_size = string
    vm_name = string
  }))
  }