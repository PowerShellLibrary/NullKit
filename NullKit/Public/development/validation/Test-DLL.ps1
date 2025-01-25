function Test-DLL {
    <#
.SYNOPSIS
Helper script for checking DLLs

.DESCRIPTION
This script displays information about every dll located in a given path

You can get information about
- FileVersion
- ProductVersion
- LegalCopyright
- BuildConfiguration
- TargetCPU
- JitOptimized flag

.PARAMETER DllFolder
Location of the folder with dlls.

.EXAMPLE
Test-DLL "C:\dll" -CleanHost
Clears console and then displays information about all DLLs located in "C:\dll"

.EXAMPLE
Test-DLL "C:\dll"
Displays information about all DLLs located in "C:\dll"
#>

    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$DllFolder,
        [Parameter(Mandatory = $false)]
        [switch]$CleanHost
    )

    process {
        if (!(Test-Path $DllFolder)) {
            Write-Host "Incorrect folder path:" -ForegroundColor Red
            Write-Host "$LogsFolder" -ForegroundColor Red
            exit
        }

        $scriptBlock = {
            [CmdletBinding()]
            param([string]$DllFolder)

            begin {
                Import-Module DLLInfo
            }

            process {
                Get-ChildItem -LiteralPath $DllFolder -Filter "*.dll" | % {
                    Write-Host $_.FullName -ForegroundColor Yellow
                    $versionInfo = (Get-Item $_.FullName).VersionInfo
                    Write-Host "FileVersion   `t`t[$($versionInfo.FileVersion)]"
                    Write-Host "ProductVersion`t`t[$($versionInfo.ProductVersion)]"
                    Write-Host "LegalCopyright`t`t[$($versionInfo.LegalCopyright)]"
                    $buildConfiguration = Get-BuildConfiguration $_.FullName
                    if ($buildConfiguration -eq "Release") {
                        Write-Host "BuildConfiguration`t[$buildConfiguration]" -ForegroundColor Green
                    }
                    else {
                        Write-Host "BuildConfiguration`t[$buildConfiguration]" -ForegroundColor Red
                    }
                    $targetCPU = Get-TargetCPU $_.FullName
                    Write-Host "TargetCPU`t`t[$targetCPU] "
                    $jitOptimized = Test-JitOptimized $_.FullName
                    Write-Host "JitOptimized`t`t[$jitOptimized]"
                    write-host ""
                }
            }
        }

        $tmp = New-TemporaryFile
        $scriptBlock.ToString() | Out-File $tmp.FullName
        $scriptFilePath = [System.IO.Path]::ChangeExtension($tmp.FullName, ".ps1")
        $tmp | Rename-Item -NewName $tmp.Name.Replace(".tmp", ".ps1")
        Invoke-Expression "powershell.exe $scriptFilePath `"'$DllFolder'`""
        Remove-Item $scriptFilePath -Force
    }
}