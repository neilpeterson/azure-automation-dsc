<#

.DESCRIPTION
    Compile DSC configuration.

.NOTES
    Author: Neil Peterson
    Intent: Sample to demonstrate DSC complication.
 #>

 $params = @{
    SourcePath = "https://raw.githubusercontent.com/neilpeterson/azure-automation-dsc/master/support-scripts/windows-config-updated.ps1";
    ResourceGroupName = "IgniteTourDemo";
    AutomationAccountName = "IgniteTourDemo"
}

Import-AzAutomationDscConfiguration @params -Published