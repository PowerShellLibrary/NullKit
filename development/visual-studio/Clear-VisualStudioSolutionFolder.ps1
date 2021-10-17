function Get-FoldersToRemove {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, Position = 0 )]
        [string]$StartPath
    )

    begin {
        Write-Verbose "Cmdlet Get-FoldersToRemove - Begin"
        $foldersToRemove = @()
    }

    process {
        Write-Verbose "Cmdlet Get-FoldersToRemove - Process"
        Get-ChildItem -Path $StartPath -Recurse -ErrorAction SilentlyContinue | ? { $_.Extension -eq ".csproj" } | % {
            Write-Verbose "[CSPROJ]: $($_.FullName)"

            $binPath = "$($_.Directory)/bin"
            if (Test-Path $binPath) {
                Write-Verbose "`t[BIN]:`t`t $binPath"
                $binFolder = Get-Item -Path $binPath
                $foldersToRemove += $binFolder
            }

            $objPath = "$($_.Directory)/obj"
            if (Test-Path $objPath) {
                Write-Verbose "`t[OBJ]:`t`t $objPath"
                $objFolder = Get-Item -Path $objPath
                $foldersToRemove += $objFolder
            }

            [xml]$csproj = Get-Content -Path $_.FullName
            if ($csproj.Project.ItemGroup.None.Include | ? { $_ -eq "packages.config" }) {
                $prjcRelativePath = $csproj.Project.ItemGroup.Reference.HintPath | ? { $_ -ne $null -and $_.Length -gt 0 } | ? { $_.Contains("\packages\") } | Select-Object -First 1
                if ($prjcRelativePath -ne $null) {


                    $path = [System.IO.Path]::GetFullPath((Join-Path  $_.DirectoryName $prjcRelativePath ))
                    if (Test-Path $path) {
                        $dllFile = Get-Item -Path $path
                        $packagesFolder = $dllFile

                        while ($packagesFolder.Name -ne "packages" -and $packagesFolder.Parent -ne $packagesFolder) {
                            $packagesFolder = Get-Item $packagesFolder.PSParentPath
                        }

                        if ($foldersToRemove.Length -eq 0 -or ($foldersToRemove.FullName.Contains($packagesFolder.FullName) -eq $false)) {
                            Write-Verbose "`t[PACKAGES]:`t $packagesFolder"
                            $foldersToRemove += $packagesFolder
                        }
                    }
                }
            }
        }
        $foldersToRemove
    }

    end {
        Write-Verbose "Cmdlet Get-FoldersToRemove - End"
    }
}

function Clear-VisualStudioSolutionFolder {
    <#
.SYNOPSIS
Solution folder cleanup

.DESCRIPTION
Removes bin, obj folders for all projects in a given directory

.PARAMETER StartPath
Start directory

.EXAMPLE
Clear-VisualStudioSolutionFolder -StartPath "C:\repo\XA\src\"
Runs solution cleanup for all projects under "C:\repo\XA\src\"

#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, Position = 0 )]
        [string]$StartPath,
        [Parameter(Mandatory = $false, Position = 1 )]
        [switch]$Confirm
    )

    begin {
        Write-Verbose "Cmdlet Clear-VisualStudioSolutionFolder - Begin"
    }

    process {
        Write-Verbose "Cmdlet Clear-VisualStudioSolutionFolder - Process"
        Get-FoldersToRemove $StartPath | % {
            if ($Confirm) {
                Remove-Item -Path $_.FullName -Recurse -Confirm
            }
            else {
                Remove-Item -Path $_.FullName -Recurse
            }
        }
    }

    end {
        Write-Verbose "Cmdlet Clear-VisualStudioSolutionFolder - End"
    }
}