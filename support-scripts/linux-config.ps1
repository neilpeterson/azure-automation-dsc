<#
 .DESCRIPTION
    Installs the Nano package

 .NOTES
    Author: Neil Peterson
    Intent: Configure Linux system for Ignite Tour LP4S3.
 #>

 configuration linuxpackage {

    Import-DscResource -ModuleName PsDesiredStateConfiguration
    Import-DSCResource -Module nx

    Node "localhost" {

        nxPackage httpd {
            Name = "httpd"
            Ensure = "Present"
            PackageManager = "Yum"
        }
    }
}