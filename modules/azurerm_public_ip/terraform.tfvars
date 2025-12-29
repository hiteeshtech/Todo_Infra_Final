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
    allocation_method = "Dynamic"
  }
}
