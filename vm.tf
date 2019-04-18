resource "azurerm_virtual_machine" "trbhi_web" {
  name                  = "Trbhi-Terraform-WebVM"
  location              = "${var.location}"
  resource_group_name   = "${azurerm_resource_group.terraform_rg.name}"
  network_interface_ids = ["${azurerm_network_interface.public_nic.id}"]
  vm_size               = "Standard_DS1_v2"

#This will delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04.0-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "osdisk-1"
    caching               = "ReadWrite"
    create_option         = "FromImage"
        managed_disk_type = "Premium_LRS"
  }

  os_profile {
    computer_name  = "ubuntuweb"
    admin_username = "${var.vm_username}"

  }

  os_profile_linux_config {
    disable_password_authentication = true
        ssh_keys {
            path     = "/home/trbhi/.ssh/authorized_keys"
            key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD6RCSlFGmdRqUAOAtJgaxZb5PuUiyWzUKeKTdumPlbU1CoqE+hn+kHl6klA0+qNuwBYZUfB/zHfjCSX+9oPnshA6lI9wzpB2GWKHuqGsv+tc1qqrnRzoIXwxWyaASnkI1Ot0WjOZoAKKkYMunKKycnQC6jNGgHG5rBm4HGoh73FP+qeNlkIq18iyplS0xsUlA/d9ya+kdGMe8TcALTQpPdJkIqGQBTjANFY/VWbkdkI9udSPjRn57e2an48FUhjTea3hyDYCtEGK5GTgvtz0Imqc7wRbClcA3btXgMwBjefe+iVXMyqLqGetTx6EHpzSXtXrakqIABk+7qm+W0eVVX nagarajg"
        }
  }

  boot_diagnostics {
        enabled = "true"
        storage_uri = "${azurerm_storage_account.trbhi_storage.primary_blob_endpoint}"
    }

  tags {
    group = "Trbhi"
  }
}

resource "azurerm_virtual_machine" "trbhi_db" {
  name                  = "Trbhi-Terraform-DBVM"
  location              = "${var.location}"
  resource_group_name   = "${azurerm_resource_group.terraform_rg.name}"
  network_interface_ids = ["${azurerm_network_interface.private_nic.id}"]
  vm_size               = "Standard_DS1_v2"

#This will delete the OS disk and data disk automatically when deleting the VM
  delete_os_disk_on_termination = true


  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04.0-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name                  = "osdisk-2"
    caching               = "ReadWrite"
    create_option         = "FromImage"
        managed_disk_type = "Premium_LRS"
  }

  os_profile {
    computer_name  = "ubuntudb"
    admin_username = "${var.vm_username}"
    }

  os_profile_linux_config {
    disable_password_authentication = true
        ssh_keys {
            path     = "/home/trbhi/.ssh/authorized_keys"
            key_data = "ssh-rsa XXXXXXXXXXXXXXXXXXXX"
        }
  }

  boot_diagnostics {
        enabled = "true"
        storage_uri = "${azurerm_storage_account.trbhi_storage.primary_blob_endpoint}"
    }

  tags {
    group = "Trbhi"
  }
}
