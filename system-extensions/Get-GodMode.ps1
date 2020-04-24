function Get-GodMode {
    <#
.SYNOPSIS
Get God Mode!

.DESCRIPTION
Turns explorer window into Admin panel

.EXAMPLE
Get-GodMode

#>
    Set-Location $env:TEMP
    $godMode = "GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}"
    if (Test-Path($godMode)) {
        Remove-Item $godMode
    }
    mkdir $godMode
    Set-Location $godMode
    Start-Process .
    Set-Location ..
    Remove-Item $godMode
}