Prerequisite

        1. An Azure account
        2. A Linux Machine for terraform control server
        3. Login to azure account using " az login " command on the terraform control server
        4. SSH key pairs  - Generate an SSH key pairs
        5. Install terraform and configure PATH - reference : https://learn.hashicorp.com/terraform/getting-started/install.html
        6. Copy all the files to a single folder
        7. Update the public key file ( Generated at 4th step ) in vm.rf file
  
  
Provisioning the environment:

 To initialize a working directory containing Terraform configuration file.
  
      terraform init
      
 To create an execution plan 
 
      terraform plan" -var-file="var_values.tfvars
      
 To provision the resources on azure
 
      terraform apply -var-file="var_values.tfvars
  
Destroying the environment
 
      terraform destroy -var-file="var_values.tfvars"
  
  
  



