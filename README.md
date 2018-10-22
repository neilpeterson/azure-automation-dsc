# Ignite Tour LP4S3

A series of linked templates are stored in the `./arm-templates` directory.

Running `azureDeploy.json` results in the following:

- Azure Automation account is deployed.
- Azure Automation DSC Pull Server is deployed.
- [DSC configuration](https://github.com/Azure-Samples/ignite-tour-lp4/blob/master/LP4S3/dsc-configurations/windows-config.ps1) uploaded and compiled.
- Log Analytics account deployed.
- X VMs created and onboarded into DSC.
- VMs configured with the DSC and report as compliant
- Deploys Software Update solution and links to Azure Automation account.

## Deploy the Azure Automation solution

Run the following Azure CLI command to deploy the solution.

```
az group create --name AzureAutomationDSC --location westeurope
az group deployment create --resource-group AzureAutomationDSC --template-file azureDeploy.json --parameters @azuredeploy.parameters.json
```

Or, use this button.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fneilpeterson%2Fazure-automation-dsc%2Fmaster%2Fadd-aa-packs%2FazureDeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

## TODO:

- Add resource group to template.
- Add Azure Automation Runbook to break x number of VM so they return non-compliant.
- Automate configuration of Software Updates, Inventory, and Change Tracking.