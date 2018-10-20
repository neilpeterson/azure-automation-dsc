<#
 .DESCRIPTION
    Enables the IIS feature.

 .NOTES
    Author: Neil Peterson
    Intent: Configure Windows system for Ignote Tour LP4S3.
 #>

 configuration windows-features {

    param
    (
        [string[]]$NodeName = 'localhost'
    )

    Import-DscResource -ModuleName PsDesiredStateConfiguration

    node $NodeName {

        WindowsFeature WebServer {
            Ensure = "Present"
            Name = "Web-Server"
        }
    }
}