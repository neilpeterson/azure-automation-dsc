<#
 .DESCRIPTION
    Creates logs on VM with custom script extension.

 .NOTES
    Author: Neil Peterson
    Intent: Sample to demonstrate Azure VM Custom Script Extension.
 #>

 $params = @{
    resourceGroupName = "lp4s3demo";
    location = "westeurope";
    name = "win-vm-0";
    vmName = "win-vm-0";
    FileUri = "https://raw.githubusercontent.com/neilpeterson/azure-automation-dsc/master/support-scripts/cpu-leak.ps1";
    Run = "cpu-leak.ps1"
}

Set-AzVMCustomScriptExtension @params