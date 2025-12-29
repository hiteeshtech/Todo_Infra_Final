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

variable "rg_name" {
  type = map(object({
    name       = string
    location   = string
    managed_by = string
    tags       = map(string)
  }))
  description = "Resource group configuration"
}

variable "key_vaults" {
  type = map(object({
    name     = string
    location = string
    rg_name  = string
    tags     = optional(map(string))
  }))
  description = "Key Vault configuration"
}

variable "public_ip_name" {
  type = map(object({
    name              = string
    rg_name           = string
    location          = string
    allocation_method = string
  }))
}

variable "vms" {
  type = map(object({
    nic_name               = string
    location               = string
    rg_name                = string
    vnet_name              = string
    subnet_name            = string
    pip_name               = string
    vm_name                = string
    size                   = string
    kv_name                = string
    admin_username         = string
    admin_password         = string
    source_image_reference = map(string)
  }))
}

variable "mssql_server_name" {
  type = map(object({
    mssql_server_name   = string
    rg_name             = string
    location            = string
    version             = string
    minimum_tls_version = string

  }))
}

variable "mssql_db_name" {
  description = "The name of the MSSQL Databases"
  type = map(object({
    mssql_db_name = string
    collation     = string
    license_type  = string
    max_size_gb   = number
    sku_name      = string
    enclave_type  = string
  }))
}

variable "mssql_server_id" {
  type = string
}

variable "pipeline_sp_object_id" {
  type = string
}
