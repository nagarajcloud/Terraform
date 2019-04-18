Prerequisite

        1. An Azure account
        2. Login to azure account using " az login " command on the terraform control server
        3. SSH key pairs
        4. Install terraform and configure PATH - reference : https://learn.hashicorp.com/terraform/getting-started/install.html
        5. Copy all the files to a single folder
  
  
Provisioning the environment:

 To initialize a working directory containing Terraform configuration file.
  
      terraform init
      
 To create an execution plan 
 
      terraform plan" -var-file="var_values.tfvars
      
 To provision the resources on azure
 
      terraform apply -var-file="var_values.tfvars
  
Destroying the environment
 
      terraform destroy -var-file="var_values.tfvars"
  
  
  



