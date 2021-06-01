resource "azurerm_route_table" "udr" {
  name                          = var.name
  location                      = var.location
  resource_group_name           = var.rg_name
  disable_bgp_route_propagation = var.bgp_propagation
  tags                          = var.tags
}
resource "azurerm_route" "routes" {
  depends_on = [
    azurerm_route_table.udr
  ]
  for_each               = var.routes
  name                   = each.key
  route_table_name       = azurerm_route_table.udr.name
  resource_group_name    = var.rg_name
  address_prefix         = lookup(var.routes, each.key).address_prefix
  next_hop_in_ip_address = lookup(var.routes, each.key).next_hop_in_ip_address
  next_hop_type          = lookup(var.routes, each.key).next_hop_type
}
