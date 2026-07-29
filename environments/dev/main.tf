module "resource_group" {
  source = "../../modules/resource_group"
  rgs = var.resource_group
}
module "storage_account" {
  source = "../../modules/storage_account"
  sas = var.storage_account
  depends_on = [ module.resource_group ]
}
module "virtual_network" {
  source = "../../modules/virtual_network"
  depends_on = [ module.resource_group ]
  vnets = var.virtual_network
}
module "subnets"{
  source = "../../modules/subnet"
  depends_on = [module.virtual_network]
  subnets = var.subnets
}
module "pip"{
  source = "../../modules/public_ip"
  depends_on = [ module.resource_group ]
  pips = var.pip
}
module "vm"{
  source = "../../modules/virtual_machine"
  vms = var.virtual_machine
  depends_on = [ module.subnets , module.pip ]
}