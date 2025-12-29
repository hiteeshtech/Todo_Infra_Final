rg_name = {
  rg1 = {
    name       = "hitu-rg-01"
    location   = "centralindia"
    managed_by = "hitesh owner"
    tags = {
      environment = "dev"
      project     = "todo-monolithic-infra"
    }
  }
}

vnet_name = {
  vnet1 = {
    name          = "hitu-vnet-01"
    rg_name       = "hitu-rg-01"
    location      = "centralindia"
    address_space = ["10.0.0.0/16"]
    tags = {
      environment = "dev"
      project     = "todo-monolithic-infra"
    }

    subnets = [{
      name             = "hitu-subnet-01"
      address_prefixes = ["10.0.1.0/24"]
      },
      {
        name             = "hitu-subnet-02"
        address_prefixes = ["10.0.2.0/24"] # Changed from 10.1.0.0/24 to be within VNet range
    }]
  }
}

key_vaults = {
  kv_frontend = {
    name     = "hiteshkeyvault01"
    location = "centralindia"
    rg_name  = "hitu-rg-01"
    tags = {
      environment = "dev"
      project     = "todo-monolithic-infra"
    }

  }
}
pipeline_sp_object_id = "1b037cd3-51bb-4c7b-a51b-e23cb38e593a"

public_ip_name = {
  pip1 = {
    name              = "hitu-public-ip-01"
    rg_name           = "hitu-rg-01"
    location          = "centralindia"
    allocation_method = "Static"
  }

  pip2 = {
    name              = "hitu-public-ip-02"
    rg_name           = "hitu-rg-01"
    location          = "centralindia"
    allocation_method = "Static"
  }
}

vms = {
  vm1 = {
    nic_name       = "hiteshnic-1"
    location       = "centralindia"
    rg_name        = "hitu-rg-01"
    vnet_name      = "hitu-vnet-01"
    subnet_name    = "hitu-subnet-01"
    pip_name       = "hitu-public-ip-01"
    vm_name        = "hiteshvmfrontend"
    size           = "Standard_D2s_v3"
    kv_name        = "hiteshkeyvault01"
    admin_username = "sharmah91"
    admin_password = "sharmah0123@@"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }

  vm2 = {
    nic_name       = "hiteshnic-2"
    location       = "centralindia"
    rg_name        = "hitu-rg-01"
    vnet_name      = "hitu-vnet-01"
    subnet_name    = "hitu-subnet-02"
    pip_name       = "hitu-public-ip-02"
    vm_name        = "hiteshvmbackend"
    size           = "Standard_D2s_v3"
    kv_name        = "hiteshkeyvault01"
    admin_username = "sharmah91"
    admin_password = "Sharma0123@@"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
}


mssql_server_name = {
  sql_server_1 = {
    mssql_server_name   = "hitusqlserver-01"
    rg_name             = "hitu-rg-01"
    location            = "centralindia"
    version             = "12.0"
    minimum_tls_version = "1.2"
  }
}

mssql_db_name = {
  mssql_db_1 = {
    mssql_db_name = "hitusqldb-01"
    collation     = "SQL_Latin1_General_CP1_CI_AS"
    license_type  = "BasePrice"
    max_size_gb   = 10
    sku_name      = "GP_Gen5_2"
    enclave_type  = "Default"
  }
}


