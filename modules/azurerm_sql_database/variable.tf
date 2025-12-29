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
