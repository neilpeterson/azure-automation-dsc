# Ignite Tour LP4S3

A series of linked templates are stored in the `./arm-templates` directory.

## Deploy the Azure Automation solution

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fneilpeterson%2Fazure-automation-dsc%add-aa-packs%2FazureDeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>


Or run the following Azure CLI commands.

```
az group create --name AzureAutomationDSC --location westeurope
az group deployment create --resource-group AzureAutomationDSC --template-file azureDeploy.json --parameters @azuredeploy.parameters.json
```

## Notes:

Running `azureDeploy.json` results in the following:

- Azure Automation account is deployed.
- Azure Automation DSC Pull Server is deployed.
- [DSC configuration](https://github.com/Azure-Samples/ignite-tour-lp4/blob/master/LP4S3/dsc-configurations/windows-config.ps1) uploaded and compiled.
- Log Analytics account deployed.
- Inventory and Change Tracking sollutions are deployed and linked to automation account.
- X VMs created and onboarded into DSC.
- VMs configured with the DSC and report as compliant
- Deploys Software Update solution and links to Azure Automation account.

## TODO:

- Add resource group to template.
- Add Azure Automation Runbook to break x number of VM so they return non-compliant.
- Update VM deployments so that VMs are onboarded to Software Updates, Inventory, and Change Tracking.