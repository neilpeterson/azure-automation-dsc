# Ignite Tour LP4S3

A series of linked templates are stored in the `./arm-templates` directory.

## Deploy the Azure Automation solution

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fneilpeterson%2Fazure-automation-dsc%2Fmaster%2Fazure-templates%2FazureDeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

Or run the following Azure CLI commands.

```
az group create --name AzureAutomationDSC --location westeurope
az group deployment create --resource-group AzureAutomationDSC --template-file azureDeploy.json --parameters @azuredeploy.parameters.json
```

## Notes:

Running `azureDeploy.json` results in the following:

- Azure Automation account is deployed
- Azure Automation DSC Pull Server is deployed
- [DSC configuration](https://github.com/Azure-Samples/ignite-tour-lp4/blob/master/LP4S3/dsc-configurations/windows-config.ps1) uploaded and compiled.
- Log Analytics account deployed
- Inventory solution deployed
- Change tracking solution deployed
- Software update solution deployed
- X VMs created and onboarded into DSC
- VMs configured with the DSC configuration and report as compliant
- VMs are onboarded to inventory, change tracking, software update solutions
- Azure Monitor Action Group is created
- Azurre Monitor alert is created and applied to all VMs in RG

## TODO:

- Add resource group to template
- Add Azure Automation Runbook to break x number of VM so they return non-compliant
- Add Software update deployment
- Add some VM inventory automation
