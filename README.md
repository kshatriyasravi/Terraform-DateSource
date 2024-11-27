# Terraform-DateSource
This is a terraform learning repo were we learn about data source
Data source is nothing but a reterving the data from apis 
for suppose  if you want to communicate with different accounts with automation activatity, 
then we use the data source.

For this we are creating one execise were :
----------------------------------------------------------------------------------------------------
1. Define an aws data source to retervie the most recent ubuntu ami
2. create an output to print  the id   of the reterived ami
3. create an ec2 instance with the reterived ami with the instance type for now use free type like t2.micro
4. configure  the instance root block device with the volume size of 10, a volume type of gp3 and set it to be deleted on termination.


Commands for reference :
------------------------------------------------------------------------------------------------------
# We will use the AWS provider to create the resources in our AWS account
# We will use the terraform init command to initialize the terraform working directory
# We will use the terraform apply command to apply the configuration in this file to our AWS account
# We will use the terraform destroy command to destroy the resources in our AWS account
# We will use the terraform plan command to see what changes will be made to our AWS account
# We will use the terraform show command to see the current state of our AWS account
# We will use the terraform fmt command to format the terraform configuration files
# We will use the terraform validate command to validate the terraform configuration files
# We will use the terraform console command to interact with the terraform state
# We will use the terraform output command to get the values of the output variables
# We will use the terraform refresh command to refresh the terraform state
# We will use the terraform taint command to mark a resource as tainted
# We will use the terraform untaint command to remove the tainted status from a resource
# We will use the terraform workspace command to manage multiple terraform workspaces
# We will use the terraform workspace select command to select a terraform workspace
# We will use the terraform workspace list command to list all the terraform workspaces
# We will use the terraform workspace delete command to delete a terraform workspace
# We will use the terraform workspace new command to create a new terraform workspace
# We will use the terraform workspace rename command to rename a terraform workspace
# We will use the terraform workspace show command to show the current terraform workspace
# We will use the terraform workspace select command to select a terraform workspace
# We will use the terraform workspace list command to list all the terraform workspaces
# We will use the terraform workspace delete command to delete a terraform workspace
# We will use the terraform workspace new command to create a new terraform workspace
# We will use the terraform workspace rename command to rename a terraform workspace
# We will use the terraform workspace show command to show the current terraform workspace
# We will use the terraform workspace select command to select a terraform workspace
# We will use the terraform workspace list command to list all the terraform workspaces
# We will use the terraform workspace delete command to delete a terraform workspace
# We will use the terraform workspace new command to create a new terraform workspace
# We will use the terraform workspace rename command to rename a terraform workspace
# We will use the terraform workspace show command to show the current terraform workspace
# We will use the terraform workspace select command to select a terraform workspace
# We will use the terraform workspace list command to list all the terraform workspaces