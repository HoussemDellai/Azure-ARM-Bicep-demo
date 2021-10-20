# source of the template:
# https://github.com/Azure/azure-quickstart-templates/tree/master/quickstarts/microsoft.web/web-app-sql-database

az group create -n rg-arm -l westeurope

az deployment group create \
   --resource-group rg-arm \
   --name rollout01 \
   --template-file azuredeploy.json \
   --parameters azuredeploy.parameters.json

az deployment group create \
   --resource-group rg-arm \
   --name rollout01 \
   --template-file main.bicep

az deployment group what-if \
   --resource-group rg-arm \
   --name rollout01 \
   --template-file azuredeploy.json \
   --parameters azuredeploy.parameters.json