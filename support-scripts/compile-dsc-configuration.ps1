<#

.DESCRIPTION
    Compile DSC configuration.

.NOTES
    Author: Neil Peterson
    Intent: Sample to demonstrate DSC compilation.
 #>

 $params = @{
    ConfigurationName = "windowsfeaturesupdated";
    ResourceGroupName = "IgniteTourDemoVideos";
    AutomationAccountName = "o27mrdfgxybzw"
}

Start-AzAutomationDscCompilationJob @params