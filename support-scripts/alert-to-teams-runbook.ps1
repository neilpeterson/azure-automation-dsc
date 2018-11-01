<#
 .DESCRIPTION
    Catches VM alert, and posts to MS Teams.

 .NOTES
    Author: Neil Peterson
    Intent: Sample to demonstrate Azure Automation Features.
 #>

 Param(
    [parameter (Mandatory=$false)]
    [object] $WebhookData
)

# Gather data
$RequestBody = $WebhookData.RequestBody | ConvertFrom-Json
$TeamsURI = Get-AutomationVariable -Name 'TeamsURI'
$VMName = $RequestBody.data.SearchResult.tables.rows

# Teams request body
$Body = ConvertTo-Json @{
    text = 'IIS Service has stopped: ' + $VMName
}

# Teams request
Invoke-WebRequest -Uri $TeamsURI -Method Post -Body $Body -ContentType 'application/json' -UseBasicParsing

# Get Azure VM
$VMObject = get-azvm | where {$_.Name -eq $VMName}

# Run script to start service
$params = @{
    VM = $VMObject;
    ScriptPath = "w3svc-service.ps1";
    CommandId = "RunPowerShellScript"
}

Invoke-AzVMRunCommand @params