<#
 .DESCRIPTION
    Creates logs on VM with custom script extension.

 .NOTES
    Author: Neil Peterson
    Intent: Sample to demonstrate Azure VM Custom Script Extension.
 #>

 Param(
    [parameter (Mandatory=$true)]
    [string] $vmName
)

 $cred = Get-AutomationPSCredential -Name azureCredentials
 Add-AzureAccount -Credential $cred

 $params = @{
    resourceGroupName = "win-server";
    location = "eastus";
    name = "win-server";
    vmName = "win-server";
    FileUri = "https://raw.githubusercontent.com/neilpeterson/azure-powershell-demos/master/2-custom-script-extension/log-script.ps1";
    Run = "log-script.ps1"
}

Set-AzVMCustomScriptExtension @params