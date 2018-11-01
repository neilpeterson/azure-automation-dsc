<#

.DESCRIPTION
    Import DSC configuration.

.NOTES
    Author: Neil Peterson
    Intent: Sample to import DSC configuration.
 #>

$import = @{
    SourcePath = "windowsfeaturesupdated.ps1";
    ResourceGroupName = "IgniteTourDemo";
    AutomationAccountName = "vc7yddstm66b6"
}

Import-AzAutomationDscConfiguration @import -Published