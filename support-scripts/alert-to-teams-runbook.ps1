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

$RequestBody = $WebhookData.RequestBody | ConvertFrom-Json

$Data = $RequestBody.data

Write-Output $RequestBody
Write-Output "-------"
Write-Output $Data.name

# # Teams Webhook URI
$TeamsURI = Get-AutomationVariable -Name 'TeamsURI'



# Notify Team
$Body = ConvertTo-Json @{
    text = 'Azure Monitor Alert: ' + $Data.name
}

Invoke-WebRequest -Uri $TeamsURI -Method Post -Body $Body -ContentType 'application/json' -UseBasicParsing