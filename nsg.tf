resource "azurerm_network_security_group" "nsg_web" {
  name = "Trbhi-Terraform-Web-NSG"
  location = "${var.location}"
  resource_group_name = "${azurerm_resource_group.terraform_rg.name}"

  security_rule {
    name = "AllowSSH"
    priority = 1001
    direction = "Inbound"
    access         = "Allow"
    protocol = "Tcp"
    source_port_range       = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }


  tags {
group = "Trbhi"
  }
}

resource "azurerm_network_security_group" "terraform_nsg_db" {
  name = "Trbhi-Terraform-DB-NSG"
  location = "${var.location}"
  resource_group_name = "${azurerm_resource_group.terraform_rg.name}"

  security_rule {
    name = "AllowMySQL"
    priority= 1002
    direction= "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range       = "*"
    destination_port_range     = "3306"
    source_address_prefix      = "${var.subnet1_cidr}"
    destination_address_prefix = "*"
  }

  security_rule {
name = "AllowSSH"
priority = 1001
direction = "Inbound"
access         = "Allow"
protocol = "Tcp"
source_port_range       = "*"
    destination_port_range     = "22"
    source_address_prefix      = "${var.subnet1_cidr}"
    destination_address_prefix = "*"
  }

  tags {
group = "Trbhi"
  }
}
