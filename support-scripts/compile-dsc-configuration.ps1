<#

.DESCRIPTION
    Compile DSC configuration.

.NOTES
    Author: Neil Peterson
    Intent: Sample to demonstrate DSC compilation.
 #>

 $params = @{
    ConfigurationName = "windowsfeaturesupdated";
    ResourceGroupName = "IgniteTourDemo";
    AutomationAccountName = "vc7yddstm66b6"
}

Start-AzAutomationDscCompilationJob @params