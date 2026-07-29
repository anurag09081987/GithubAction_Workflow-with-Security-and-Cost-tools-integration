resource "azurerm_storage_account" "this"{
    for_each = var.sas
    name = each.value.sa_name
    location = each.value.location
    resource_group_name = each.value.rg_name
    account_tier = "Standard"
    account_replication_type = "ZRS"
}