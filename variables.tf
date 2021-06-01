variable "name" {
  type = string
}
variable "location" {
  type = string
}
variable "rg_name" {
  type = string
}
variable "bgp_propagation" {
  type    = bool
  default = true
}
variable "routes" {
  type = map(map(string))
}
variable "tags" {
  type    = map(any)
  default = {}
}
