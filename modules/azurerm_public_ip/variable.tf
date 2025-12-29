variable "public_ip_name" {
  type = map(object({
    name              = string
    rg_name           = string
    location          = string
    allocation_method = string
  }))
}
