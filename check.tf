terraform {
  required_providers {
    vra7 = {
      source = "vmware/vra7"
      version = "2.0.0"
    }
  }
}

provider "vra7" {
  username = "zabbix-vra@example.com"
  password = "StrongPassword85!"
  tenant   = "vsphere.local"
  host     = "https://vcloud.example.com"
  insecure = "true"
}

resource "vra7_deployment" "this" {
  count = 1
  catalog_item_name = "CentOS 8 2004"
  description = "test machine for monitoring"
  businessgroup_name = "BG_NAME"

  resource_configuration  {
      component_name = "CentOS8"
      configuration = {
            "root.password" = "StrongPasswordForRoot"
            cpu = 2
            lease_days = 330
            memory = 2048
        }
    }
}