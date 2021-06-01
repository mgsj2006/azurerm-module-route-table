output "udr_id" {
  value = azurerm_route_table.udr.id
}
output "routes" {
    value = {for route,id in azurerm_route.routes: route=> id.id}
}