# Terraform - Entra ID Access Package

## Requirements ##

Dependencies:  
* Azure CLI - https://learn.microsoft.com/en-us/cli/azure/install-azure-cli  
* Powershell  

For MacOS and Linux modify the scripts below to run in Bash.  
<br />

### Login to Azure CLI and get TenantID ###
```
az login --tenant <tenant>
az account show --query tenantId
```
<br />

### Create app registration ###
```
$app=$(az rest -method post -uri https://graph.microsoft.com/v1.0/applications --headers 'Content-Type=application/json' --body '{\"displayName\": \"Terraform Service Principal 2\"}' --query appId --output tsv)

$appid=$app.id
$clientid=$app.appId

echo "clientID = $clientid"
```
<br />

###  Add client secret with expiration ###
```
$clientsecretname="Q1_2024_6M"
$clientsecret=$(az ad app credential reset --id $clientid --append --display-name $clientsecretname --end-date '2024-09-07' --query password --output tsv)
echo "client secret = $clientsecret"
```
<br />

###  Add api permissions ###
```
az rest --method PATCH --uri https://graph.microsoft.com/v1.0/applications/$appid --headers "Content-Type=application/json" --body '{\"requiredResourceAccess\":[{\"resourceAppId\":\"00000003-0000-0000-c000-000000000000\",\"resourceAccess\":[{\"id\":\"df021288-bdef-4463-88db-98f22de89214\",\"type\":\"Role\"},{\"id\":\"62a82d76-70ea-41e2-9197-370581804d09\",\"type\":\"Role\"},{\"id\":\"9acd699f-1e81-4958-b001-93b1d2506e19\",\"type\":\"Role\"}]}]}'
```

Permission: User.Read  
Permission ID: df021288-bdef-4463-88db-98f22de89214  
Description: Used to read users in this script

Permission: Group.ReadWrite.All  
Permission ID: 62a82d76-70ea-41e2-9197-370581804d09  
Description: Used to create groups in this script

Permission: EntitlementManagement.ReadWrite.All  
Permission ID: 9acd699f-1e81-4958-b001-93b1d2506e19  
Description: Used to create access packages, catalogs, assignment and associations in this script  
<br />

###  Concent to api permissions ###
az ad app permission admin-consent --id $appid
<br />
_Requires global admin_  
<br />

### Create variables that Terraform will use ###

Create terraform.auto.tfvars file and add
```
tenant_id     = "Your tenant id"
client_id     = "Terraform Service Principal client ID"
client_secret = "Terraform Service Principal client secret"
```