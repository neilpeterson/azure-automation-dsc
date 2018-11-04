<#

.DESCRIPTION
    Import DSC configuration.

.NOTES
    Author: Neil Peterson
    Intent: Sample to import DSC configuration.
 #>

$import = @{
    SourcePath = "windowsfeaturesupdated.ps1";
    ResourceGroupName = "IgniteTourDemoVideos";
    AutomationAccountName = "o27mrdfgxybzw"
}

Import-AzAutomationDscConfiguration @import -Published