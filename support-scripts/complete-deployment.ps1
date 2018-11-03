<#

.DESCRIPTION
    Compile DSC configuration.

.NOTES
    Author: Neil Peterson
    Intent: Sample to demonstrate DSC complication.
 #>

 $params = @{
    Name = "Webhook007";
    IsEnabled = $True;
    ExpiryTime = "10/2/2019";
    RunbookName = "W3SVCRemediation";
    ResourceGroupName = "githubTest001";
    AutomationAccountName = "wfvpvbt6wjf7a"
}

$webhook = New-AzAutomationWebhook @params -Force

Write-Output $webhook