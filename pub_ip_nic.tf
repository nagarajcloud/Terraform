resource "azurerm_public_ip" "trbhi_pip" {
  name = "Trbhi-Terraform-PIP"
  location = "${var.location}"
  resource_group_name = "${azurerm_resource_group.terraform_rg.name}"
  allocation_method = "Static"

  tags {
group = "Trbhi"
  }
}

resource "azurerm_network_interface" "public_nic" {
  name       = "Trbhi-Terraform-Web"
  location       = "${var.location}"
  resource_group_name = "${azurerm_resource_group.terraform_rg.name}"
  network_security_group_id = "${azurerm_network_security_group.nsg_web.id}"

  ip_configuration {
    name = "Trbhi-Terraform-WebPrivate"
    subnet_id = "${azurerm_subnet.trbhi_subnet_1.id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id= "${azurerm_public_ip.trbhi_pip.id}"
  }
  tags {
group = "Trbhi"
  }
}

resource "azurerm_public_ip" "trbhi_db_pip" {
  name                  = "Trbhi-Terraform-DB-PIP"
  location              = "${var.location}"
  resource_group_name   = "${azurerm_resource_group.terraform_rg.name}"
  allocation_method = "Static"

  tags {
        group = "Trbhi"
  }
}

resource "azurerm_network_interface" "private_nic" {
  name = "Trbhi-Terraform-DB"
  location = "${var.location}"
  resource_group_name = "${azurerm_resource_group.terraform_rg.name}"
  network_security_group_id = "${azurerm_network_security_group.terraform_nsg_db.id}"

  ip_configuration {
    name = "Trbhi-Terraform-DBPrivate"
    subnet_id = "${azurerm_subnet.trbhi_subnet_2.id}"
    private_ip_address_allocation = "Static"
    private_ip_address = "192.168.2.5"
    public_ip_address_id        = "${azurerm_public_ip.trbhi_db_pip.id}"
  }
  tags {
group = "Trbhi"
  }
}
