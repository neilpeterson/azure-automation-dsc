# Ignite Tour LP4S3

These templates deploy the base infrastructure and demo artifacts for Ignite Tour LP4-S3. Deploy the templates using the `Deploy to Azure` button or with any Azure tooling.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fneilpeterson%2Fazure-automation-dsc%2Fmaster%2Fazure-templates%2FazureDeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

## Template Parameters

| Parameter Name | Description |
|---|---|
| adminUsername | Admin user name for the Windows virtual machines. |
| adminPassword | Admin password nemae for the Windows virtual machines. |
| VMCount | The number of VMs create. |
| email | The email address configured with the Azure Monitor alert. |

## Configurations

The following assets and configurations are deployed with this series of templates.

- Azure Automation account with the DSC, Inventory and Change Tracking, and Software Updates solutions.
- DSC Configuration is uploaded and compiled into DSC Pull Server.
- Azure Monitor alert (70% CPU utilization).
- Azure Monitor Action Group to send email on alert.
- Virtual Machines are deployed, onboarded into all automation solutions, configured with DSC, and become monitored by Azure Monitor.

## Other

A script named `cpu-leak.ps1` can be found under the `support-scripts` directory. This script can be used to trigger the Azure Monitor alert.

## Coming Soon

I am working on the following items.

- Dashboard: Azure Dashboard that will contain monitoring metrics.
- DSC, Inventory, and Change Tracking scripts to stage demos (create change, break DSC configurations, etc.).
- Linux examples.
- Send Azure Monitor alert to MS Teams (issue creating AA Runbook webhook with template).

## Session Demo Steps

**Demo 1 - configuration management**

- Quick visual tour of DSC configuration (pre-populated with compliant and non-compliant systems)
- Quick visual tour of inventory and change tracking solution (pre-populated with systems)
- Create DSC configuration and compile into Azure Automation Pull Server (CLI or PowerShell)
- Create VM and auto-onboard to pull server (CLI or PowerShell), show that VM is configured.via DSC
- Note: after the last step, back to PPT and then demo results just before demo 2

**Demo 2 - software updates**

- Quick visual tour of software update solution (pre-populated with compliant and non-compliant systems)
- Create update deployment with Azure CLI / PowerShell
- Create dynamic update group to include VM created in last demo
- Create software update deployment (template)

**Demo 3 - azure monitor**

- Create Azure Monitor alert with automation (Portal, CLI, or Template)
- Demonstrate raised alert on existing system
- Configure Azure Automation Runbook with Webhook, configure alert to trigger Runbook, send alert to MS Teams