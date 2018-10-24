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

# Teams Webhook URI
$TeamsURI = Get-AutomationVariable -Name 'TeamsURI'

If($Data.operationName -match "Microsoft.ContainerInstance/containerGroups/write" -and $Data.status -match "Succeeded") {

    # Runbook Ouput
    Write-Output "VM Alert.."
    Write-Output $Data.resourceUri

    # Get Contianer Instance Name
    $name = ($Data.resourceUri.Split("/"))[-1]

    # Notify Team
    $Body = ConvertTo-Json @{
        text = 'Contianer Instance Created: ' + $name
    }
    Invoke-WebRequest -Uri $TeamsURI -Method Post -Body $Body -ContentType 'application/json' -UseBasicParsing
}
else
{
    Write-Error "Could not find Container Instance write event"
}