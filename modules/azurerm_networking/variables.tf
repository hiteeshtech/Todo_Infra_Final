variable "vnet_name" {
  type = map(object({
    name          = string
    rg_name       = string
    location      = string
    address_space = list(string)
    tags          = map(string)
    subnets = list(object({
      name             = string
      address_prefixes = list(string)
    }))
  }))
  description = "Virtual network configuration including subnets"
}
