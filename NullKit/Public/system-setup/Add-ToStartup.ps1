function Add-ToStartup {
    <#
.SYNOPSIS
Script for adding items to system startup

.DESCRIPTION
With this cmdlet you can add items to startup. You can add items for a current user or computer/all users

.PARAMETER ItemPath
Specifies the path to an item.

.PARAMETER ComputerConfiguration
Specifies whether item should be added to the computer/all users startup folder

.EXAMPLE
Add-ToStartup -ItemPath C:\Windows\System32\notepad.exe
This command shows how to add 'notepad.exe' program to Startup.

.EXAMPLE
Add-ToStartup -ComputerConfiguration -ItemPath C:\Windows\System32\notepad.exe
This command shows how to add 'notepad.exe' program to Startup for computer/all users
#>
    [Cmdletbinding(SupportsShouldProcess = $true)]
    Param
    (
        [Parameter(Mandatory = $true, Position = 0)]
        [Alias('p')][String]$ItemPath,
        [Parameter(Mandatory = $false, Position = 1)]
        [Alias('cc')][Switch]$ComputerConfiguration
    )

    If (Test-Path -Path $ItemPath) {
        If ($ComputerConfiguration) {
            $ComputerConfigDestination = "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\StartUp"
            Copy-Item -Path $ItemPath -Destination $ComputerConfigDestination
        }
        Else {
            $UserConfigDestination = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"
            Copy-Item -Path $ItemPath -Destination $UserConfigDestination
        }
    }
    Else {
        Write-Warning "The path does not exist, plese input the correct path."
    }
}